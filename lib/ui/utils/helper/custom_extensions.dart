import 'package:flutter/material.dart';

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension BuildExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  FocusScopeNode get focus => FocusScope.of(this);
}
