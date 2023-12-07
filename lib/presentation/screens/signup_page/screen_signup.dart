import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/sign_up/sign_up_bloc.dart';
import 'package:love_bites_user_app/data/models/sign_up_model/sign_up_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_otp_model/signup_otp_model.dart';
import 'package:love_bites_user_app/presentation/common/validators/validator.dart';
import 'package:love_bites_user_app/presentation/common/widgets/widgets.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/presentation/screens/login_page/screen_login.dart';
import 'package:love_bites_user_app/presentation/screens/otp_validation_page/screen_otp_validation.dart';
import 'package:love_bites_user_app/util/alert_popup_fucntions/error_response_snackbar.dart';
import 'package:love_bites_user_app/util/alert_popup_fucntions/success_response_snackbar.dart';

// ignore: must_be_immutable
class ScreenSignUpPage extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ScreenSignUpPage({super.key});

  SignUpModel signUpmodel = SignUpModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.response?.status == 500) {
            ScaffoldMessenger.of(context).showSnackBar(
                successResponseMessageSnackbar(
                    message: state.response!.message!));
            Future.delayed(const Duration(seconds: 2), () {
              // signUpmodel.fullname = fullNameController.text.trim();
              // signUpmodel.phone = phoneController.text.trim();
              // signUpmodel.username = userNameController.text.trim();
              // signUpmodel.password = passwordController.text.trim();

              signUpmodel.fullname = 'Ashiq Sabith';
              signUpmodel.phone = '8606863748';
              signUpmodel.username = 'Ashiq@123';
              signUpmodel.password = 'ashiq@123';

              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return ScreenOtpValidation(
                  signUpModel: signUpmodel,
                );
              }));
            });
          } else if (state.response!.status! >= 400) {
            ScaffoldMessenger.of(context).showSnackBar(
                errorResponseMessageSnackbar(
                    message: state.response!.message!));
          }
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 33, 54, 67),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/animations/Love.json',
                    height: 130,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          customInputField(
                              'Fullname',
                              Icons.account_circle_outlined,
                              false,
                              nameValidator,
                              fullNameController),
                          const SizedBox(
                            height: 10,
                          ),
                          customInputField(
                            'Phone Number',
                            Icons.phone_android,
                            false,
                            phoneValidator,
                            phoneController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customInputField(
                            'Username',
                            Icons.co_present_outlined,
                            false,
                            userNameValidator,
                            userNameController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customInputField(
                            'Password',
                            Icons.lock_open,
                            false,
                            paswwordValidator,
                            passwordController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customInputField(
                            'Confirm Password',
                            Icons.lock_outline,
                            false,
                            paswwordValidator,
                            passwordConfirmController,
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return LoadingAnimationWidget.inkDrop(
                          color: Colors.white,
                          size: 25,
                        );
                      }
                      return authButton(context, 'Sign Up', _formKey, () {
                        if (!_formKey.currentState!.validate()) {
                          context.read<SignUpBloc>().add(SendOtp(
                              signUpOtpModel: SignupOtpModel(
                                  // phone: phoneController.text.trim()
                                  phone: '8606863748')));
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 224, 224, 224),
                        height: 2,
                        width: 70,
                      ),
                      const SmallText(
                        size: 17,
                        text: 'Or Sign up with',
                        color: Color.fromARGB(255, 224, 224, 224),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 224, 224, 224),
                        height: 2,
                        width: 70,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customGoogleButton(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SmallText(
                        text: 'If you are olden',
                        size: 17,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return ScreenLoginPage();
                            }));
                          },
                          child: const SmallText(
                            size: 17,
                            text: ('Login'),
                            color: Color.fromARGB(255, 224, 224, 224),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
