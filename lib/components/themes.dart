import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

class MyTheme {

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: blackColor,
    colorScheme: const ColorScheme.dark(),
    primaryColor: blackColor,
    iconTheme: const IconThemeData(color: whiteColor, opacity: 1),
    brightness: Brightness.values.first,
    backgroundColor: const Color(0xFF212121), //Colors.black26,
    primarySwatch: Colors.grey,
    dividerColor: Colors.black12,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primaryDeepColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: blackColor,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: primaryDeepColor,
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: whiteColor,
      ),
      subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: whiteColor,
        height: 1.3,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryDeepColor,
      unselectedItemColor: whiteColor,
      elevation: 25,
      backgroundColor: blackLightColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: blackLightColor,
      elevation: 20,
      titleTextStyle: TextStyle(
          color: whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: blackLightColor,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    fontFamily: 'jannah',
  );


  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    colorScheme: const ColorScheme.light(),
    primaryColor: primaryDeepColor,
    iconTheme: const IconThemeData(color: primaryDeepColor, opacity: 1),
    brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primaryDeepColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: blackColor,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: primaryDeepColor,
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: blackColor,
      ),
      subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: blackColor,
        height: 1.3,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryDeepColor,
      unselectedItemColor: blackColor,
      elevation: 20,
      backgroundColor: whiteColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryDeepColor,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primaryLightColor,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    fontFamily: 'jannah',
  );
}
