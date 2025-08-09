import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle().copyWith(
        fontSize: 40,
        shadows: [
          Shadow(color: Colors.black, offset: Offset(-1, 2), blurRadius: 2),
        ],
      ),
    ),
  );
}
