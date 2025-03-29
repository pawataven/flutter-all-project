//ทำ ธีม data ให้เเอป
import 'package:flutter/material.dart';
import 'package:shopo_app/root/root_colors.dart';

class Styles {
  static ThemeData themeData({
    required bool isDarkTheme,
    required BuildContext context,
  }) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? root_colors.black : root_colors.lightScarffoldColors,

      cardColor: isDarkTheme ? root_colors.light1 : root_colors.light3,

      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? root_colors.light2 : root_colors.light1,
        centerTitle: true,
        toolbarHeight: 90.0, // ตั้งค่าความสูงของ App Bar

        titleTextStyle: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        iconTheme: IconThemeData(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: isDarkTheme ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
