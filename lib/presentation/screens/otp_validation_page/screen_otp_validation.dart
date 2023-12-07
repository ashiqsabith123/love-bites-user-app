import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/otp_verification/otp_verification_bloc.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/data/models/sign_up_model/sign_up_model.dart';
import 'package:love_bites_user_app/util/alert_popup_fucntions/error_response_snackbar.dart';
import 'package:love_bites_user_app/util/alert_popup_fucntions/success_response_snackbar.dart';
import 'package:pinput/pinput.dart';

class ScreenOtpValidation extends StatelessWidget {
  SignUpModel signUpModel = SignUpModel();
  ScreenOtpValidation({super.key, required this.signUpModel});

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
    return BlocListener<OtpVerificationBloc, OtpVerificationState>(
      listener: (context, state) {
        if (state.response?.status == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
              successResponseMessageSnackbar(
                  message: state.response!.message!));
        } else if (state.response!.status! >= 400) {
          ScaffoldMessenger.of(context).showSnackBar(
              errorResponseMessageSnackbar(
                  message: state.response!.message!));
        }
      },
      child: Scaffold(
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
                    text: "+91 ${signUpModel.phone}",
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
                        
                          signUpModel.otp = value.toString();
                          context
                              .read<OtpVerificationBloc>()
                              .add(Validate(signUpModel: signUpModel));
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
                      builder: (context, state) {
                    if (state.isLoading) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoadingAnimationWidget.inkDrop(
                            color: Colors.white,
                            size: 25,
                          )
                        ],
                      );
                    }

                    return SizedBox();
                  }),
                  SizedBox(
                    height: 20,
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
      ),
    );
  }
}
