import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:love_bites_user_app/common/widgets/widgets.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
//import 'package:love_bites_user_app/presentation/login_page/widgets/login_widgets.dart';

class ScreenLoginPage extends StatelessWidget {
  const ScreenLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 87, 1, 1),
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
                      SizedBox(
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
                  SizedBox(
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
                  SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthButton(),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: Colors.black,
                        height: 2,
                        width: 70,
                      ),
                      const SmallText(text: 'Or Login with'),
                      Container(
                        color: Colors.black,
                        height: 2,
                        width: 70,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.golf_course_sharp),
                          label: SmallText(text: 'Google'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SmallText(text: 'If you are new'),
                      TextButton(
                          onPressed: () {},
                          child: const SmallText(text: ('Create an account')))
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
