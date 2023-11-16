import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:love_bites_user_app/presentation/common/validators/validator.dart';
import 'package:love_bites_user_app/presentation/common/widgets/widgets.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/presentation/screens/login_page/screen_login.dart';

class ScreenSignUpPage extends StatelessWidget {
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
                      customInputField('Fullname',
                          Icons.account_circle_outlined, false, nameValidator),
                      const SizedBox(
                        height: 10,
                      ),
                      customInputField('Phone Number', Icons.phone_android,
                          false, phoneValidator),
                      const SizedBox(
                        height: 10,
                      ),
                      customInputField('Username', Icons.co_present_outlined,
                          false, userNameValidator),
                      const SizedBox(
                        height: 10,
                      ),
                      customInputField(
                        'Password',
                        Icons.lock_open,
                        false,
                        paswwordValidator,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customInputField(
                        'Confirm Password',
                        Icons.lock_outline,
                        false,
                        paswwordValidator,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              authButton(context, 'Sign Up', _formKey),
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
                          return const ScreenLoginPage();
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
