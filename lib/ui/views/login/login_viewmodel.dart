import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:studydeck_app/app/app.locator.dart';
import 'package:studydeck_app/app/app.router.dart';
import 'package:studydeck_app/data/services/auth_service.dart';
import 'package:studydeck_app/ui/utils/helper/helper.dart';
import 'package:studydeck_app/ui/views/login/login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    setBusy(true);
    try {
      await _authService.logIn(emailValue!, passwordValue!);
      await _navigationService.clearStackAndShow(Routes.homeView);
      setBusy(false);
    } catch (error) {
      print(error);
      showCustomDialog(error.toString());
      setBusy(false);
    }
  }

  Future<void> navigateToRegister() async {
    await _navigationService.replaceWithRegisterView();
  }
}
