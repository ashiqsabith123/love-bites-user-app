// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:love_bites_user_app/presentation/common/validators/validator.dart';
// import 'package:love_bites_user_app/presentation/common/widgets/widgets.dart';
// import 'package:love_bites_user_app/core/textstyles/style.dart';
// import 'package:love_bites_user_app/presentation/screens/signup_page/screen_signup.dart';

// class ScreenLoginPage extends StatelessWidget {
//   TextEditingController userNameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   ScreenLoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 33, 54, 67),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(25),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Lottie.asset(
//                         'assets/animations/Kiss.json',
//                         height: 250,
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text(
//                         'Make some love',
//                         style: TextStyle(
//                             fontFamily: 'Pacifico',
//                             color: Colors.white,
//                             fontSize: 20),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Form(
//                     child: Column(
//                       children: [
//                         customInputField(
//                             "Username",
//                             Icons.account_circle_outlined,
//                             false,
//                             phoneValidator,
//                             userNameController),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         customInputField(
//                           "Password",
//                           Icons.lock,
//                           true,
//                           phoneValidator,
//                           passwordController,
//                         )
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       TextButton(
//                           onPressed: () {},
//                           child: const SmallText(
//                             size: 17,
//                             text: 'Forgot Password',
//                             color: Color.fromARGB(255, 224, 224, 224),
//                           )),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // authButton(context, 'Login'),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                         color: Color.fromARGB(255, 224, 224, 224),
//                         height: 2,
//                         width: 70,
//                       ),
//                       const SmallText(
//                         size: 17,
//                         text: 'Or Login with',
//                         color: Color.fromARGB(255, 224, 224, 224),
//                       ),
//                       Container(
//                         color: Color.fromARGB(255, 224, 224, 224),
//                         height: 2,
//                         width: 70,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       customGoogleButton(context),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SmallText(
//                         text: 'If you are new',
//                         size: 17,
//                       ),
//                       TextButton(
//                           onPressed: () {
//                             Navigator.of(context)
//                                 .push(MaterialPageRoute(builder: (ctx) {
//                               return ScreenSignUpPage();
//                             }));
//                           },
//                           child: const SmallText(
//                             size: 17,
//                             text: ('Create an account'),
//                             color: Color.fromARGB(255, 224, 224, 224),
//                           ))
//                     ],
//                   )
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
