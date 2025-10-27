import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  bool get isDarkMode {
    final theme = Theme.of(this); // lay theme hien tai cua app 
    final platformBrightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return theme.brightness == Brightness.dark ||
        platformBrightness == Brightness.dark;
  }
}