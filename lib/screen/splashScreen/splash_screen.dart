import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../components/constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                    radius: 50,
                    child: Image(image: AssetImage('assets/images/logo.png'))
                ),
                const SizedBox(height: 10,),
                RichText(
                    text: const TextSpan(
                        children: [
                          TextSpan(text: appDisplayName, style: TextStyle(color: primaryDeepColor, fontSize: 30, fontWeight: FontWeight.bold)),
                        ]
                    )),
                const SizedBox(height: 10),
                const Text(appSloganName, style: TextStyle(color: primaryLightColor, fontSize: 14, fontWeight: FontWeight.normal),),
                const SizedBox(height: 30),

              ],
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: MaterialButton(
                  onPressed: () => {},
                  child: const Text(appVersion, style: TextStyle(color: primaryLightColor, fontSize: 15, fontWeight: FontWeight.normal),),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
