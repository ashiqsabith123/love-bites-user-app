import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/home_page/home_page_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';

class CustomAlertDailogBox extends StatelessWidget {
  const CustomAlertDailogBox({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          kHeightFourty,
          kHeightFourty,
          kHeightFourty,
          kHeightFourty,
          Card(
            elevation: 3,
            child: Column(
              children: [
                Container(
                  width: screenSize.width,
                  height: MediaQuery.of(context).size.height / 4.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      color: Color.fromARGB(255, 46, 53, 68)),
                  child: Column(children: [
                    Lottie.asset(
                      'assets/animations/Erro.json',
                      height: 130,
                    ),
                    Text(
                      'Something went wrong',
                      style: TextStyle(color: Colors.white),
                    ),
                    kHeightTwenty
                  ]),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(onPressed: () {}, child: Text('Exit')),
                      Container(
                        width: 2,
                        height: 20,
                        color: Colors.black,
                      ),
                      TextButton(
                          onPressed: () {
                            context.read<HomePageBloc>().add(FetchMatches());
                          },
                          child: Text('Try Again'))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
