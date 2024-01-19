import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:lottie/lottie.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/send_otp/send_otp_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';

import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/data/models/auth_otp_model/auth_otp_model.dart';

import 'package:love_bites_user_app/presentation/screens/otp_auth_page/widgets/widgets.dart';
import 'package:love_bites_user_app/presentation/screens/otp_verification_page/screen_otp_verification.dart';
import 'package:love_bites_user_app/util/alert_popup_fucntions/custom_snackbar.dart';

class ScreenOtpAuth extends StatelessWidget {
  ScreenOtpAuth({super.key});
  final TextEditingController phoneController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    phoneController.addListener(() {
      if (phoneController.text.length == 10) {
        _focusNode.unfocus();
      }
    });
    return BlocListener<SendOtpBloc, SendOtpState>(
      listener: (context, state) {
        if (state is SendOtpResponseState) {
          if (state.sendOtpResponse!.status == 200) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (ctx) {
              return ScreenOtpVerification(
                phoneNumber: phoneController.text,
              );
            }));
          } else if (state.sendOtpResponse!.status! >= 400) {
            showCustomSnackBar(
                context, 1, 'Something error', state.sendOtpResponse!.message!);
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Lottie.asset('assets/animations/Phone-Otp.json',
                      height: 180, repeat: false),
                  kHeightTen,
                  BoldText(text: 'Enter your', color: Colors.black),
                  BoldText(text: 'phone number', color: Colors.black),
                  kHeightTwenty,
                  kHeightTwenty,
                  NumberStack(
                    phoneController: phoneController,
                    focus: _focusNode,
                  ),
                  BlocBuilder<SendOtpBloc, SendOtpState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            LoadingAnimationWidget.inkDrop(
                              // leftDotColor: Colors.black12,
                              // rightDotColor: Colors.blue,
                              color: Color.fromARGB(255, 226, 201, 59),
                              size: 35,
                            )
                          ],
                        );
                      }
                      return NextButton(onclick: () {
                        if (phoneController.text.isEmpty) {
                          showCustomSnackBar(context, 4, 'On Snap!!',
                              'Please enter a phone number');
                        } else if (phoneController.text.length < 10) {
                          showCustomSnackBar(context, 1, 'On Snap!!',
                              'Please enter a valid phone number');
                        } else {
                          context.read<SendOtpBloc>().add(SendOtp(
                              authOtpModel: AuthOtpModel(
                                  phone: phoneController.text.trim())));
                        }
                      });
                    },
                  ),
                  kHeightTwenty,
                  kHeightTwenty,
                  kHeightTwenty,
                  kHeightTwenty,
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/svg/google.svg')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
