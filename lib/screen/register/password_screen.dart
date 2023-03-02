import 'package:biztore/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../components/constants.dart';


class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String? gender;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading:  IconButton(
              icon: const Icon(Icons.arrow_back, color: primaryDeepColor),
              onPressed: () { Get.back(); },
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(1.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/phone_register_bg.png'),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Let's set your password",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0
                            ),
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: primaryLightColor,
                              ),
                              borderRadius: BorderRadius.circular(36),
                            ),
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                //First Name
                                const Expanded(
                                  child:  TextField(
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      contentPadding:  EdgeInsets.symmetric(vertical: 12.0),
                                    ),
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0
                            ),
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: primaryLightColor,
                              ),
                              borderRadius: BorderRadius.circular(36),
                            ),
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Expanded(
                                  child:  TextField(
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: 'Confirm Password',
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      contentPadding:  EdgeInsets.symmetric(vertical: 12.0),
                                    ),
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: primaryDeepColor,
                              borderRadius: BorderRadius.circular(36),
                            ),
                            alignment: Alignment.center,
                            child: InkWell(
                                child: const Text('Register', textAlign: TextAlign.center, style: TextStyle(color: whiteColor, fontSize: 18),),
                                onTap:(){ Get.offAll(() => HomeScreen()); }
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      );
  }
}
