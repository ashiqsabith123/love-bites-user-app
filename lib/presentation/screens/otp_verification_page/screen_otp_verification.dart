import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/presentation/screens/otp_auth_page/screen_otp_auth.dart';

import 'package:love_bites_user_app/presentation/screens/otp_verification_page/widgets/widgets.dart';

class ScreenOtpVerification extends StatelessWidget {
  const ScreenOtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Lottie.asset(
              'assets/animations/Verify-Otp.json',
              height: 200,
            ),
            kHeightTen,
            BoldText(text: 'OTP', color: Colors.black),
            BoldText(text: 'verification', color: Colors.black),
            kHeightTen,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 28)),
                Text(
                  '+91',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                kWidthFive,
                Text(
                  '8606863748',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (ctx) {
                        return ScreenOtpAuth();
                      }));
                    },
                    icon: const Icon(FeatherIcons.edit3))
              ],
            ),
            kHeightTwenty,
            OtpVerificationStack(
                // phoneController: phoneController,
                // focus: _focusNode,
                ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resend",
                      style: TextStyle(
                          fontSize: 17, color: Color.fromARGB(255, 90, 90, 90)),
                    )),
                VerifyNextButton(onclick: () {})
              ],
            )
          ],
        ),
      ),
    )));
  }
}
