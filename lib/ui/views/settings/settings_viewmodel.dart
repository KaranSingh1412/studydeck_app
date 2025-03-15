import 'package:stacked/stacked.dart';
import 'package:studydeck_app/app/app.locator.dart';
import 'package:studydeck_app/data/models/user_model.dart';
import 'package:studydeck_app/data/services/auth_service.dart';
import 'package:studydeck_app/data/services/user_service.dart';

class SettingsViewModel extends FutureViewModel<User?> {
  final UserService _userService = locator<UserService>();
  final AuthService _authService = locator<AuthService>();

  @override
  Future<User?> futureToRun() async {
    return await _userService.getUserInfo();
  }

  Future<void> logout() async {
    await _authService.logout();
  }
}
