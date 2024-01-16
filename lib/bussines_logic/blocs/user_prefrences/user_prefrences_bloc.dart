import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:love_bites_user_app/data/data_providers/save_user_prefrences/save_user_prefrences_data_provider.dart';
import 'package:love_bites_user_app/data/models/common_response_model/common_response_model.dart';
import 'package:love_bites_user_app/data/models/user_prefrences_model/user_prefrences_model/user_prefrences_model.dart';
import 'package:meta/meta.dart';

part 'user_prefrences_event.dart';
part 'user_prefrences_state.dart';

class UserPrefrencesBloc
    extends Bloc<UserPrefrencesEvent, UserPrefrencesState> {
  SaveUserPrefDataProvider saveUserPrefDataProvider =
      SaveUserPrefDataProvider();
  UserPrefrencesBloc() : super(UserPrefrencesInitial()) {
    on<ChangeUserPrefrencePage>((event, emit) {
      emit(PageChangedState());
    });

    on<SaveUserPrefrences>((event, emit) async {
      print(event.userPrefrencesModel.toJson());
      final resp = await saveUserPrefDataProvider
          .saveUserPref(event.userPrefrencesModel);

      print(resp.toJson());

      emit(UserPrefrencesSavedState(resp: resp));
    });
  }
}
