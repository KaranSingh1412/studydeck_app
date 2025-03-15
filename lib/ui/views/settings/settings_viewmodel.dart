import 'package:stacked/stacked.dart';
import 'package:studydeck_app/app/app.locator.dart';
import 'package:studydeck_app/data/models/user_model.dart';
import 'package:studydeck_app/data/services/user_service.dart';

class SettingsViewModel extends FutureViewModel<User?> {
  final UserService _userService = locator<UserService>();
  @override
  Future<User?> futureToRun() async {
    return await _userService.getUserInfo();
  }
}
