import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/presentation/common/widgets/widgets.dart';
import 'package:pinput/pinput.dart';

class ScreenOtpValidation extends StatelessWidget {
  String fullName;
  ScreenOtpValidation({super.key,required this.fullName});
  
  

  TextEditingController otpController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 40,
    height: 50,
    textStyle: const TextStyle(
      fontSize: 300,
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 2, color: Colors.white),
      ),
    ),
  );
  final focusedPinTheme = PinTheme(
    width: 40,
    height: 50,
    textStyle: const TextStyle(
      fontSize: 30,
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 2, color: Colors.white)),
    ),
  );
  final submittedPinTheme = const PinTheme(
    width: 40,
    height: 50,
    textStyle: TextStyle(
      fontSize: 30,
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 2, color: Colors.white)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 54, 67),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(
                  text: 'Verify Otp',
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                SmallText(
                  size: 15,
                  text: 'We have sent a verification code to ',
                  color: Color.fromARGB(255, 179, 179, 179),
                ),
                SizedBox(
                  height: 5,
                ),
                SmallText(
                  text: '+91 8606863748',
                  size: 16,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  child: Pinput(
                      controller: otpController,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      length: 6,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter OTP';
                        } else {
                          return null;
                        }
                      },
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      onCompleted: (value) {
                        print("otp-------$value");
                      }),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SmallText(
                          size: 15,
                          text: "Didn't recieve code?",
                          color: Color.fromARGB(255, 179, 179, 179),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: SmallText(
                            size: 18,
                            text: "Resend",
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
