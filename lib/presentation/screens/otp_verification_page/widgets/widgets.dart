import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationStack extends StatelessWidget {
  OtpVerificationStack(this.onCompleted);

  void Function(String)? onCompleted;

  final defaultPinTheme = const PinTheme(
    width: 40,
    height: 50,
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w800,
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
    decoration: BoxDecoration(),
  );
  final focusedPinTheme = const PinTheme(
    width: 40,
    height: 50,
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w800,
      color: Color.fromRGBO(0, 0, 0, 1),
    ),
  );
  final submittedPinTheme = const PinTheme(
    width: 40,
    height: 50,
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w800,
      color: Color.fromRGBO(0, 0, 0, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Bottom container
        Container(
            width: screenSize.width,
            height: screenSize.height / 11,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Color.fromARGB(255, 91, 91, 91)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                )),
            child: Container(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: screenSize.width / 1.4,
                    child: Pinput(
                        autofocus: true,
                        // controller: otpController,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        length: 6,
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        // onCompleted: onCompleted,
                        hapticFeedbackType: HapticFeedbackType.mediumImpact,
                        onChanged: onCompleted),
                  ),
                ],
              ),
            )),
        // Top container (overlapping)
        Positioned(
          left: 15,
          top: -16,
          child: Container(
            color: Colors.white,
            width: screenSize.width / 6,
            height: screenSize.height / 25,
            child: const Center(
                child: Text(
              'OTP',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            )),
          ),
        ),
        // Add more overlapping containers as needed
      ],
    );
  }
}

class VerifyNextButton extends StatelessWidget {
  VerifyNextButton(
      {super.key,
      required this.onclick,
      required this.color,
      required this.fontColor});

  final VoidCallback onclick;
  final Color color;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Align(
        alignment: Alignment.center,
        child: InkWell(
            onTap: onclick,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: color),
              width: screenSize.width / 2,
              height: screenSize.height / 14,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: fontColor),
                    ),
                  ],
                ),
              ),
            )));
  }
}
