import 'package:biztore/screen/register/username_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/constants.dart';
import 'country_picker.dart';


class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  void _callBackFunction(String name, String dialCode, String flag) {
    // place your code
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                      height: 10,
                    ),
                    const Text(
                      'Enter Your Phone Number',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 24,
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
                                CountryPicker(
                                  callBackFunction: _callBackFunction,
                                  headerText: 'Select Country',
                                  headerBackgroundColor: Theme.of(context).primaryColor,
                                  headerTextColor: whiteColor,
                                ),
                                const Expanded(
                                  child:  TextField(
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                                    decoration: InputDecoration(
                                      hintText: 'Phone Number',
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      contentPadding:  EdgeInsets.symmetric(vertical: 12.0),
                                    ),
                                    keyboardType: TextInputType.number,
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
                            child:  InkWell(
                                child: const Text('Continue', textAlign: TextAlign.center, style: TextStyle(color: whiteColor, fontSize: 18),),
                                onTap:(){ Get.to(() => const UsernameScreen()); }
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
