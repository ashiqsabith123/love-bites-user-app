import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/otp_verification/otp_verification_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/data/models/verify_otp_model/verify_otp_model.dart';
import 'package:love_bites_user_app/presentation/screens/home_page/screen_home_page.dart';
import 'package:love_bites_user_app/presentation/screens/otp_auth_page/screen_otp_auth.dart';

import 'package:love_bites_user_app/presentation/screens/otp_verification_page/widgets/widgets.dart';
import 'package:love_bites_user_app/presentation/screens/user_details_page/screen_user_details.dart';
import 'package:love_bites_user_app/util/alert_popup_fucntions/custom_snackbar.dart';

class ScreenOtpVerification extends StatelessWidget {
  final String phoneNumber;
  String? otp;
  ScreenOtpVerification({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpVerificationBloc, OtpVerificationState>(
      listener: (context, state) {
        if (state is OtpVerifiedState) {
          if (state.tokenResponse.status == 200) {
            if (state.tokenResponse.data?.userfound == false) {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return ScreenUserDetails();
              }));
            } else if (state.tokenResponse.data?.userfound == true) {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return ScreenHomePage();
              }));
            }
          } else if (state.tokenResponse.status! >= 400) {
            showCustomSnackBar(
                context,
                1,
                state.tokenResponse.message ?? "Server error",
                state.tokenResponse.error ?? "Something Went wrong");
          }
        }
      },
      child: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
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
                    phoneNumber,
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
              OtpVerificationStack((value) {
                if (value.length < 6) {
                  context.read<OtpVerificationBloc>().add(NextButtonDisable());
                } else {
                  context.read<OtpVerificationBloc>().add(NextButtonEnable());
                  otp = value;
                }
              }),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Resend",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 90, 90, 90)),
                      )),
                  BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
                    builder: (context, state) {
                      if (state.showButton!) {
                        return VerifyNextButton(
                          onclick: () {
                            context.read<OtpVerificationBloc>().add(VerifyOtp(
                                verifyOtpModel: VerifyOtpModel(
                                    phone: phoneNumber, otp: otp)));
                          },
                          color: Color.fromARGB(255, 226, 201, 59),
                          fontColor: Colors.black,
                        );
                      } else if (state is VerifyOtpLoadingState) {
                        return Align(
                          alignment: Alignment.center,
                          child: LoadingAnimationWidget.inkDrop(
                            // leftDotColor: Colors.black12,
                            // rightDotColor: Colors.blue,
                            color: Color.fromARGB(255, 226, 201, 59),
                            size: 35,
                          ),
                        );
                      }

                      return VerifyNextButton(
                        // onclick: () {},
                        color: Color.fromARGB(134, 223, 223, 223),
                        fontColor: Color.fromARGB(255, 159, 158, 158),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ))),
    );
  }
}
