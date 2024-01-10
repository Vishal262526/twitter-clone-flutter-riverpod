import 'package:flutter/material.dart';
import 'package:twitter_clone/theme/pallate.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallate.kBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallate.kBackgroundColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallate.kBackgroundColor,
    ),
  );
}
