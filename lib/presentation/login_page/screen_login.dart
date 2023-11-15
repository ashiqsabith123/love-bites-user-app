import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:love_bites_user_app/common/widgets/widgets.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';

class ScreenLoginPage extends StatelessWidget {
  const ScreenLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 54, 67),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/animations/Animation - 1699971445661.json',
                        height: 250,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Make some love',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            color: Colors.white,
                            fontSize: 20),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Form(
                    child: Column(
                      children: [
                        CustomInputField(
                          hint: "Username",
                          obscure: false,
                          icon: Icons.account_circle_outlined,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomInputField(
                          hint: "Password",
                          obscure: true,
                          icon: Icons.lock,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const SmallText(
                            text: 'Forgot Password',
                            color: Color.fromARGB(255, 224, 224, 224),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthButton(
                        text: 'Login',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
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
                        text: 'Or Login with',
                        color: Color.fromARGB(255, 224, 224, 224),
                      ),
                      Container(
                        color: Color.fromARGB(255, 224, 224, 224),
                        height: 2,
                        width: 70,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomGoogleButton(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SmallText(text: 'If you are new'),
                      TextButton(
                          onPressed: () {},
                          child: const SmallText(
                            text: ('Create an account'),
                            color: Color.fromARGB(255, 224, 224, 224),
                          ))
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
