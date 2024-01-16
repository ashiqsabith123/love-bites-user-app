import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:love_bites_user_app/bussines_logic/blocs/user_prefrences/user_prefrences_bloc.dart';
import 'package:love_bites_user_app/data/models/user_prefrences_model/user_prefrences_model/user_prefrences_model.dart';
import 'package:love_bites_user_app/presentation/screens/user_preferences_page/screen_all_done_pag.dart';

import 'package:love_bites_user_app/presentation/screens/user_preferences_page/widgets/wigdets.dart';
import 'package:love_bites_user_app/util/alert_popup_fucntions/custom_snackbar.dart';

final UserPrefrencesModel userPrefrencesModel = UserPrefrencesModel();

class ScreenUserPreferences extends StatelessWidget {
  final PageController pagecontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserPrefrencesBloc, UserPrefrencesState>(
      listener: (context, state) {
        if (state is UserPrefrencesSavedState) {
          if (state.resp.status == 201) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (ctx) {
              return const ScreenDone();
            }));
          } else if (state.resp.status! >= 400) {
            showCustomSnackBar(
                context, 1, 'Something went wrong', state.resp.error!);
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<UserPrefrencesBloc, UserPrefrencesState>(
            builder: (context, state) {
              if (state is PageChangedState) {
                pagecontroller.nextPage(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeIn);
              }
              return PageView.builder(
                onPageChanged: (value) {
                  if (value == listView.length - 1) {
                    userPrefrencesModel.height = details[0];
                    userPrefrencesModel.maritalStatus = details[1];
                    userPrefrencesModel.faith = details[2];
                    userPrefrencesModel.motherTongue = details[3];
                    userPrefrencesModel.smokeStatus = details[4];
                    userPrefrencesModel.alcoholStatus = details[5];
                    userPrefrencesModel.settleStatus = details[6];
                    userPrefrencesModel.hobbies = details[7];
                    userPrefrencesModel.teaPerson = details[8];
                    userPrefrencesModel.loveLanguage = details[9];
                    context.read<UserPrefrencesBloc>().add(SaveUserPrefrences(
                        userPrefrencesModel: userPrefrencesModel));
                  }
                },
                physics: const NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
