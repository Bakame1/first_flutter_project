import 'package:first_flutter_project/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color=AppPallete.borderColor]) => OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 3.0,
    ),
    borderRadius: BorderRadius.circular(10),
  );//For reusability of border style

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,//copyWith allows us to customize the dark theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient1),
    ),
  );
}