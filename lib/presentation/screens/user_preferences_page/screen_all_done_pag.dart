// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:love_bites_user_app/core/constants/constants.dart';
// import 'package:love_bites_user_app/core/textstyles/style.dart';
// import 'package:love_bites_user_app/presentation/screens/user_preferences_page/widgets/wigdets.dart';

// class ScreenDone extends StatelessWidget {
//   const ScreenDone({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Lottie.asset(
//           'assets/animations/Done.json',
//           width: double.infinity,
//           repeat: false,
//         ),
//         BoldText(text: 'All done', color: Colors.black),
//         // kHeightTen,
//         // kHeightFive,
//         // const Text(
//         //   textAlign: TextAlign.center,
//         //   ' We built this app exclusively for you to meet someone special. Be good. Be authentic. Find that love',
//         //   style: TextStyle(
//         //       fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black38),
//         // ),
//         // NextButton(onclick: () {})
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/presentation/screens/user_preferences_page/widgets/wigdets.dart';

class ScreenDone extends StatelessWidget {
  const ScreenDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Lottie.asset(
              'assets/animations/Done.json',
              width: double.infinity,
              repeat: false,
            ),
            BoldText(text: 'All done', color: Colors.black),
            kHeightTwenty,
            kHeightFive,
            const Text(
              textAlign: TextAlign.center,
              ' We built this app exclusively for you to meet someone special. Be good. Be authentic. Find that love',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black38),
            ),
            kHeightTwenty,
            NextButton(onclick: () {})
          ],
        ),
      )),
    );
  }
}
