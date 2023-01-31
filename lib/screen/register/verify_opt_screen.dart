import 'package:biztore/screen/register/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import '../../components/constants.dart';



class VerifyOptScreen extends StatefulWidget {
  const VerifyOptScreen({super.key});

  @override
  _VerifyOptScreenState createState() => _VerifyOptScreenState();
}

class _VerifyOptScreenState extends State<VerifyOptScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = primaryDeepColor;
    const fillColor = whiteColor;
    const borderColor = Colors.green; //Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: primaryDeepColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

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
                      height: 10,
                    ),
                    const Text(
                      'Enter the verification code sent \n to your email',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [

                          Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Directionality(
                                // Specify direction if desired
                                textDirection: TextDirection.ltr,
                                child: Pinput(
                                  controller: pinController,
                                  focusNode: focusNode,
                                  androidSmsAutofillMethod:
                                  AndroidSmsAutofillMethod.smsUserConsentApi,
                                  listenForMultipleSmsOnAndroid: true,
                                  defaultPinTheme: defaultPinTheme,
                                  validator: (value) {
                                    return value == '9999' ? null : 'OPT is incorrect';
                                  },
                                  onClipboardFound: (value) {
                                    debugPrint('onClipboardFound: $value');
                                    pinController.setText(value);
                                  },
                                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                                  onCompleted: (pin) {
                                    debugPrint('onCompleted: $pin');
                                  },
                                  onChanged: (value) {
                                    debugPrint('onChanged: $value');
                                  },
                                  cursor: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 9),
                                        width: 22,
                                        height: 1,
                                        color: focusedBorderColor,
                                      ),
                                    ],
                                  ),
                                  focusedPinTheme: defaultPinTheme.copyWith(
                                    decoration: defaultPinTheme.decoration!.copyWith(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: focusedBorderColor),
                                    ),
                                  ),
                                  submittedPinTheme: defaultPinTheme.copyWith(
                                    decoration: defaultPinTheme.decoration!.copyWith(
                                      color: fillColor,
                                      borderRadius: BorderRadius.circular(19),
                                      border: Border.all(color: focusedBorderColor),
                                    ),
                                  ),
                                  errorPinTheme: defaultPinTheme.copyBorderWith(
                                    border: Border.all(color: Colors.redAccent),
                                  ),
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
                                child: const Text('Verify OPT', textAlign: TextAlign.center, style: TextStyle(color: whiteColor, fontSize: 18),),
                                onTap:(){
                                  focusNode.unfocus();
                                  formKey.currentState!.validate() == true ? Get.offAll(() => const PhoneScreen()) : null;
                                }
                            ),
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                              child: const Text('Resend OPT', textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
                              onTap:(){}
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
