import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/user_prefrences/user_prefrences_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/presentation/screens/user_preferences_page/widgets/wigdets.dart';

class ScreenUserPreferences extends StatelessWidget {
  PageController pagecontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserPrefrencesBloc, UserPrefrencesState>(
          builder: (context, state) {
            if (state is PageChangedState) {
              pagecontroller.nextPage(
                  duration: Duration(milliseconds: 180), curve: Curves.easeIn);
            }
            return PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: pagecontroller,
              itemCount: listView.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: listView[i],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
