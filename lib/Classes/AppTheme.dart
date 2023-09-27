import 'package:flutter/material.dart';

class AppColors {
  static const Color textBlack = Colors.black;
  static const Color textGrey = Colors.grey;
  static const Color white = Colors.white;
  static const Color lightGreyDarkMode = Colors.grey; // Adjust as needed
  static const Color darkPink = Colors.pink; // Adjust as needed
  static const Color blue = Colors.blue; // Adjust as needed
}

class AppTheme {
  ThemeData get darkTheme => ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(color: AppColors.textBlack),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.textGrey),
          labelStyle: TextStyle(color: AppColors.white),
        ),
        textTheme: const TextTheme(
          // Define text styles for dark mode here
          headlineSmall: TextStyle(
            color: Colors.white, // Change the text color for "Welcome"
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        brightness: Brightness.dark,
        canvasColor: AppColors.lightGreyDarkMode,
        // accentColor: AppColors.darkPink,
        // accentIconTheme: IconThemeData(color: Colors.white),
      );

  ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(color: AppColors.blue),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.textGrey),
          labelStyle: TextStyle(color: AppColors.white),
        ),
        textTheme: TextTheme(
          // Define text styles for light mode here
          headlineSmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey[500],
          ),
        ),
        canvasColor: AppColors.white,
        brightness: Brightness.light,
        // accentColor: AppColors.grey2,
        // accentIconTheme: IconThemeData(color: Colors.black),
      );
}
