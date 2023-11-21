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

class ScreenSignUpPage extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ScreenSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 54, 67),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
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
                      customInputField('Phone Number', Icons.phone_android,
                          false, phoneValidator, phoneController),
                      const SizedBox(
                        height: 10,
                      ),
                      customInputField('Username', Icons.co_present_outlined,
                          false, userNameValidator, userNameController),
                      const SizedBox(
                        height: 10,
                      ),
                      customInputField('Password', Icons.lock_open, false,
                          paswwordValidator, passwordController),
                      const SizedBox(
                        height: 10,
                      ),
                      customInputField('Confirm Password', Icons.lock_outline,
                          false, paswwordValidator, passwordConfirmController),
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
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<SignUpBloc>()
                          .add(SendOtp(signUpModel: SignUpModel()));
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
                    color: Color.fromARGB(255, 224, 224, 224),
                    height: 2,
                    width: 70,
                  ),
                  const SmallText(
                    text: 'Or Sign up with',
                    color: Color.fromARGB(255, 224, 224, 224),
                  ),
                  Container(
                    color: Color.fromARGB(255, 224, 224, 224),
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
                  const SmallText(text: 'If you are olden'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return ScreenLoginPage();
                        }));
                      },
                      child: const SmallText(
                        text: ('Login'),
                        color: Color.fromARGB(255, 224, 224, 224),
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
