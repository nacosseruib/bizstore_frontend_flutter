import 'dart:ui';
import 'package:flutter/material.dart';


// COLORS
const primaryDeepColor      = Color.fromARGB(255, 4, 90, 94); //Color(0xFF006064); Color.fromARGB(255, 4, 94, 84)
const primaryLightColor     = Color.fromARGB(255, 4, 95, 94); //Color(0xFF00838F);
const blackColor            = Colors.black;
const blackLightColor       = Colors.black26;
const whiteColor            = Colors.white;
const greyColor             = Colors.grey;
const greyLightColor        = Color.fromARGB(10, 0, 0, 0);
const backgroundWhiteColor  = whiteColor;
const backgroundGreyColor   = blackLightColor;
const textColor             = blackColor;


// Padding
const double kPaddingS = 8.0;
const double kPaddingM = 16.0;
const double kPaddingL = 32.0;

// Spacing
const double kSpaceS = 8.0;
const double kSpaceM = 16.0;

// Animation
const Duration kButtonAnimationDuration = Duration(milliseconds: 600);
const Duration kCardAnimationDuration = Duration(milliseconds: 400);
const Duration kRippleAnimationDuration = Duration(milliseconds: 400);
const Duration kLoginAnimationDuration = Duration(milliseconds: 1500);

// Assets
const String kGoogleLogoPath = 'assets/images/google_logo.png';

//Base URL
class Constant {
  static const String newsApiKey = '96fa1dc1fa0a4dd087c08a75faab9fb0';
  static const String baseUrl = 'https://newsapi.org/v2/';
  static const String topHeadLine = '/top-headlines';
  static const String country = 'ng';
}
const Color themeColor = primaryDeepColor; //asset picker

//circler loading widget
Widget getCircularProgressIndicator() {
  return const CircularProgressIndicator(
    backgroundColor: Colors.transparent,
    valueColor: AlwaysStoppedAnimation(primaryDeepColor),
    strokeWidth: 3,
  );
}

//Shorten Text lenght
void printFullText(dynamic text) {
  final pattern = RegExp('.{1,800}'); //800 size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


