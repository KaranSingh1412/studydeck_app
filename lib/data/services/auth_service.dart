import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../models/user_session_model.dart';
import './prefs_service.dart';
import './request_service.dart';
import './utils/exceptions.dart';
import './utils/internal/authenticator.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthService {
  final RequestService _requestManager = locator<RequestService>();
  final PrefsService _storageService = locator<PrefsService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> logIn(
    String email,
    String password,
  ) async {
    if (isLoggedIn()) return;
    final sessionToken = await _requestManager.openNewSession(email, password);

    _storageService.setSessionToken(sessionToken);
  }

  void loginWithSessionToken(String sessionToken) {
    _storageService.setSessionToken(sessionToken);
  }

  Future<void> registerUser(
    String name,
    String email,
    String password,
  ) async {
    if (isLoggedIn()) return;
    final sessionToken =
        await _requestManager.createUser(name, email, password);

    _storageService.setSessionToken(sessionToken);
  }

  Future<void> logout() async {
    assertLoggedIn();
    final auth = getAuthenticator();
    _requestManager.deleteSession(auth);
    _storageService.deleteSessionToken();
    _localLogout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  void assertLoggedIn() {
    if (!isLoggedIn()) throw LoginStateException("Not logged in!");
  }

  Authenticator getAuthenticator() {
    assertLoggedIn();
    return _getAuthenticatorUnchecked();
  }

  Authenticator _getAuthenticatorUnchecked() {
    final authToken = _storageService.getSessionToken();
    assert(authToken != null);
    return Authenticator(token: authToken);
  }

  Future<bool> sessionExists({String? deviceToken}) async {
    final auth = getAuthenticator();
    try {
      await _requestManager.getCurrentSession(auth, deviceToken: deviceToken);
      return true;
    } catch (error) {
      await logout();
      return false;
    }
  }

  Future<UserSession?> getSession() async {
    final Authenticator auth = getAuthenticator();
    try {
      final session = await _requestManager.getCurrentSession(auth);
      return session;
    } catch (_) {
      _localLogout();
    }
    return null;
  }

  void _localLogout() {
    _storageService.deleteSessionToken();
  }

  bool isLoggedIn() =>
      _storageService.isSetToken() &&
      _storageService.getSessionToken()!.isNotEmpty;
}
