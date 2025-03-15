// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;
import 'package:studydeck_app/data/models/flashcard_set.dart' as _i10;
import 'package:studydeck_app/ui/views/edit_cardset/edit_cardset_view.dart'
    as _i4;
import 'package:studydeck_app/ui/views/flashcard/flashcard_view.dart' as _i5;
import 'package:studydeck_app/ui/views/home/home_view.dart' as _i2;
import 'package:studydeck_app/ui/views/login/login_view.dart' as _i6;
import 'package:studydeck_app/ui/views/register/register_view.dart' as _i7;
import 'package:studydeck_app/ui/views/settings/settings_view.dart' as _i8;
import 'package:studydeck_app/ui/views/startup/startup_view.dart' as _i3;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const editCardsetView = '/edit-cardset-view';

  static const flashcardView = '/flashcard-view';

  static const loginView = '/login-view';

  static const registerView = '/register-view';

  static const settingsView = '/settings-view';

  static const all = <String>{
    homeView,
    startupView,
    editCardsetView,
    flashcardView,
    loginView,
    registerView,
    settingsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.editCardsetView,
      page: _i4.EditCardsetView,
    ),
    _i1.RouteDef(
      Routes.flashcardView,
      page: _i5.FlashcardView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i6.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i7.RegisterView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i8.SettingsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.EditCardsetView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.EditCardsetView(),
        settings: data,
      );
    },
    _i5.FlashcardView: (data) {
      final args = data.getArgs<FlashcardViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i5.FlashcardView(key: args.key, flashcardSet: args.flashcardSet),
        settings: data,
      );
    },
    _i6.LoginView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.LoginView(),
        settings: data,
      );
    },
    _i7.RegisterView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.RegisterView(),
        settings: data,
      );
    },
    _i8.SettingsView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.SettingsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class FlashcardViewArguments {
  const FlashcardViewArguments({
    this.key,
    required this.flashcardSet,
  });

  final _i9.Key? key;

  final _i10.FlashcardSet flashcardSet;

  @override
  String toString() {
    return '{"key": "$key", "flashcardSet": "$flashcardSet"}';
  }

  @override
  bool operator ==(covariant FlashcardViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.flashcardSet == flashcardSet;
  }

  @override
  int get hashCode {
    return key.hashCode ^ flashcardSet.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditCardsetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editCardsetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFlashcardView({
    _i9.Key? key,
    required _i10.FlashcardSet flashcardSet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.flashcardView,
        arguments: FlashcardViewArguments(key: key, flashcardSet: flashcardSet),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditCardsetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editCardsetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFlashcardView({
    _i9.Key? key,
    required _i10.FlashcardSet flashcardSet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.flashcardView,
        arguments: FlashcardViewArguments(key: key, flashcardSet: flashcardSet),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
