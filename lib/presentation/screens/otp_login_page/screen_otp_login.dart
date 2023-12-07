import 'package:flutter/material.dart';

import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/presentation/common/widgets/widgets.dart';
import 'package:love_bites_user_app/presentation/screens/otp_login_page/widgets/widgets.dart';

class ScreenOtpLogin extends StatelessWidget {
  ScreenOtpLogin({super.key});
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              BoldText(text: 'Enter your', color: Colors.black),
              BoldText(text: 'phone number', color: Colors.black),
              PhoneFiled(),
              MyStack(),
              Container(
                child: Row(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
