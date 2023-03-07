import 'dart:ui';
import 'package:flutter/material.dart';



//Literals  constants
const appDisplayName          = "VasTalk";
const appSloganName           = "Everything you need to start your Business";
const appVersion              = "Version 1.0.0 @2023";
const mySmartAINameConstant   = "$appDisplayName AI";
const chatBgWallpaperLight    =  "assets/images/chat_bg_wallpaper_light.png";
const chatBgWallpaperDark     =  "assets/images/chat_bg_wallpape_dark.png";


// COLORS
const primaryDeepColor      = Color.fromARGB(225, 5, 100, 130); //Color(0xFF006064); Color.fromARGB(255, 4, 94, 84)
const primaryLightColor     = Color.fromARGB(255, 5, 120, 140); //Color(0xFF00838F);
const flashColor            = Color.fromARGB(255, 5, 140, 160);
const blackColor            = Colors.black;
const blackLightColor       = Colors.black54;
const whiteColor            = Colors.white;
const whiteDeemColor        = Colors.white70;
const greyColor             = Colors.grey; //Colors.white60
const greyLightColor        = Color.fromARGB(10, 0, 0, 0);
const backgroundWhiteColor  = whiteColor;
const backgroundGreyColor   = blackLightColor;
const textColor             = blackColor;
const redColor              = Colors.redAccent;
const chatSenderColor       = primaryLightColor; //Color(0xFFC0CDCD);
const chatReceiverColor     = whiteDeemColor;
const chatReceiverColorDark = blackColor;

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
Widget getCircularProgressIndicator({double? value}) {
  return CircularProgressIndicator(
    backgroundColor: Colors.transparent,
    value: value,
    strokeWidth: 3,
    valueColor: AlwaysStoppedAnimation(primaryDeepColor),
  );
}

//Shorten Text lenght
void printFullText(dynamic text) {
  final pattern = RegExp('.{1,800}'); //800 size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


