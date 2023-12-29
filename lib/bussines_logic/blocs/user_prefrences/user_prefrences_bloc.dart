import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'user_prefrences_event.dart';
part 'user_prefrences_state.dart';

class UserPrefrencesBloc
    extends Bloc<UserPrefrencesEvent, UserPrefrencesState> {
  UserPrefrencesBloc() : super(UserPrefrencesInitial()) {
    
    on<ChangeUserPrefrencePage>((event, emit) {
      emit(PageChangedState());
    });
  }
}
