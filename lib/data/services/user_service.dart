import 'package:studydeck_app/app/app.locator.dart';
import 'package:studydeck_app/data/models/user_model.dart';
import 'package:studydeck_app/data/services/auth_service.dart';
import 'package:studydeck_app/data/services/request_service.dart';
import 'package:studydeck_app/ui/utils/helper/helper.dart';

class UserService {
  final RequestService _requestService = locator<RequestService>();
  final AuthService _authService = locator<AuthService>();

  Future<User?> getUserInfo() async {
    return await request(
      onExecute: _requestService.getUserInfo(_authService.getAuthenticator()),
    );
  }
}
