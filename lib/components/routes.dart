import 'package:flutter/material.dart';
import '../screen/login/login_screen.dart';





class Routes{
  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{
          '': (_) => Container(),
          '/login': (_) => LoginScreen(screenHeight: 0.0,),
          // '/home': (_) => VideoScreen(),
          // // '/home': (_) => HomePage(),
          // //'/detail': (_) => NewsDetails(),
          // '/pickvideo': (_) => const MultiAssetsPage(),
          // '/profile': (_) => const ProfileScreen(uid: '11111', slideOutProfile: true),
          // '/message': (_) => const MessageScreen(),
        };
  }
}