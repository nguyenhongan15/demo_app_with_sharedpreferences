import 'package:dnt7/helper/color/app_color.dart';
import 'package:flutter/material.dart';

class ThemeModeApp {
  static final lightTheme = ThemeData (
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.lightBG,
    brightness: Brightness.light,
    fontFamily: 'NotoSans',
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: TextStyle(
        color: AppColor.choosemode,
        fontWeight: FontWeight.w800,
      ),
      contentPadding: const EdgeInsets.all(30),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 2.0,
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 2.0,
        ) 
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),  
        )
      )
    )
  );

  static final darkTheme = ThemeData (
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.darkBG,
    brightness: Brightness.dark,
    fontFamily: 'NotoSans',
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: TextStyle(
        color: AppColor.choosemode,
        fontWeight: FontWeight.w800,
      ),
      contentPadding: const EdgeInsets.all(30),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2.0,
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2.0,
        ) 
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),  
        )
      )
    )
  );
}