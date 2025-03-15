import 'package:flutter/cupertino.dart';

import 'helper/edge_insets_helper.dart';
import 'package:flutter/material.dart';

class Themes {
  static const Color _primary = Color(0xffC2EFB3);
  static const Color _secondary = Color(0xff525B56);
  static const Color _shadowColor = Color.fromARGB(51, 0, 0, 0);
  // static const Color _surfaceColor = Color.fromARGB(255, 65, 66, 76);
  static const Color _surfaceColor = Color(0xFF2A2A2A);
  static const Color _background = Color(0xFF121212);

  static const Color _primaryLight = Colors.blue;
  static const Color _surfaceColorLight = Colors.white;
  // static const Color _backgroundLight = Color(0xffF6F4F4);
  static const Color _backgroundLight = Color(0xFFF2F2F2);

  static const double _iconSize = 30;

  static const String _fontFamily = 'Poppins';

  static ThemeData darkTheme = ThemeData(
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: _primary,
      refreshBackgroundColor: _background,
    ),
    colorScheme: const ColorScheme.dark(
      primary: _primary,
      secondary: _secondary,
      onSurface: _background,
      surface: _surfaceColor,
    ),
    useMaterial3: false,
    switchTheme: const SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(_primaryLight),
      trackColor: WidgetStatePropertyAll(_primaryLight),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _surfaceColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: _secondary,
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: _primary),
    canvasColor: Colors.black,
    shadowColor: _shadowColor,
    scaffoldBackgroundColor: _background,
    cardTheme: CardTheme(
      color: _surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      shadowColor: _shadowColor,
      margin: getSymmetricPadding(
        horizontal: 12,
        vertical: 15,
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: _background,
      foregroundColor: Colors.white,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(
        size: _iconSize,
      ),
    ),
    iconTheme: const IconThemeData(
      color: _primary,
      size: _iconSize,
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: FadePageRouteBuilder(),
      },
    ),
    dividerColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: _surfaceColor,
      elevation: 5,
      enableFeedback: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: _primary,
      unselectedItemColor: _secondary,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: _background,
      backgroundColor: _primary,
      iconSize: _iconSize,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: _background,
        backgroundColor: _primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 8,
        shadowColor: _shadowColor,
      ),
    ),
    fontFamily: _fontFamily,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontWeight: FontWeight.bold, foreground: Paint()..color = _primary),
      headlineMedium: TextStyle(
          fontWeight: FontWeight.bold, foreground: Paint()..color = _primary),
      headlineSmall:
          const TextStyle(fontWeight: FontWeight.bold, color: _secondary),
      bodyLarge:
          const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      bodyMedium:
          const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      bodySmall:
          const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      titleLarge: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
      titleMedium: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 17, color: Colors.white),
      titleSmall: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
      labelLarge: const TextStyle(color: Colors.grey),
      labelMedium: const TextStyle(color: Colors.grey),
      labelSmall: const TextStyle(color: Colors.grey),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _primaryLight, refreshBackgroundColor: _backgroundLight),
    colorScheme: const ColorScheme.light(
      primary: _primaryLight,
      secondary: _secondary,
      onSurface: _backgroundLight,
      surface: _surfaceColorLight,
    ),
    useMaterial3: false,
    listTileTheme: const ListTileThemeData(
      iconColor: _primaryLight,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: _primaryLight,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _surfaceColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: _primaryLight),
    shadowColor: _shadowColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: _backgroundLight,
    cardTheme: CardTheme(
      color: _surfaceColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      shadowColor: _shadowColor,
      margin: getSymmetricPadding(
        horizontal: 12,
        vertical: 15,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _backgroundLight,
      shadowColor: Colors.transparent,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: _primaryLight,
        size: _iconSize,
      ),
    ),
    iconTheme: const IconThemeData(
      color: _primaryLight,
      size: _iconSize,
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: FadePageRouteBuilder(),
      },
    ),
    dividerColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: _surfaceColorLight,
      elevation: 5,
      enableFeedback: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: _primaryLight,
      unselectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: _backgroundLight,
      backgroundColor: _primaryLight,
      iconSize: _iconSize,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: _backgroundLight,
        backgroundColor: _primaryLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 8,
        shadowColor: _shadowColor,
      ),
    ),
    fontFamily: _fontFamily,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontWeight: FontWeight.bold,
          foreground: Paint()..color = _primaryLight),
      headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          foreground: Paint()..color = _primaryLight),
      headlineSmall:
          const TextStyle(fontWeight: FontWeight.bold, color: _secondary),
      bodyLarge:
          const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
      bodyMedium:
          const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
      bodySmall:
          const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
      titleLarge: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
      titleMedium: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 17, color: Colors.black),
      titleSmall: const TextStyle(
          fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),
      labelLarge: const TextStyle(color: Colors.grey),
      labelMedium: const TextStyle(color: Colors.grey),
      labelSmall: const TextStyle(color: Colors.grey),
    ),
  );
}

class FadePageRouteBuilder extends CupertinoPageTransitionsBuilder {
  FadePageRouteBuilder() : super();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final widget = super
        .buildTransitions(route, context, animation, secondaryAnimation, child);
    if (widget is CupertinoPageTransition) {
      return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: const Interval(
              0.2,
              1,
              curve: Curves.easeIn,
            ),
            reverseCurve: Curves.easeOut,
          ),
          child: widget.child);
    } else {
      return widget;
    }
  }
}
