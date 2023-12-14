import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:love_bites_user_app/data/data_providers/get_location/get_location_provider.dart';
import 'package:love_bites_user_app/data/data_providers/save_user_details/save_user_details_data_provider.dart';
import 'package:love_bites_user_app/data/models/common_response_model/common_response_model.dart';
import 'package:love_bites_user_app/data/models/date_of_birth_response_model/date_of_birth_response_model.dart';
import 'package:love_bites_user_app/data/models/location_response_model/location_response_model.dart';
import 'package:love_bites_user_app/data/models/user_details_model/user_details_model.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  GetLocationProvider getLocationProvider = GetLocationProvider();
  SaveUserDetailsProvider saveUserDetailsProvider = SaveUserDetailsProvider();
  UserDetailsBloc() : super(UserDetailsInitial()) {
    on<GetLocation>((event, emit) async {
      LocationResponseModel locationResponseModel =
          await getLocationProvider.getLocation();
      emit(LocationFetchedState(locationResponseModel: locationResponseModel));
    });

    on<GetDateOfBirth>((event, emit) {
      emit(DateOfBirthFetchedState(
          dateOfBirthResponseModel: event.dateOfBirthResponseModel));
    });

    on<SelectGender>((event, emit) {
      if (event.id == 1) {
        emit(GenderSelectedState(
          color1: Color.fromARGB(255, 0, 49, 14),
          color2: Colors.white,
          fontcolor1: Colors.white,
          fontcolor2: Colors.black,
        ));
      } else if (event.id == 2) {
        emit(GenderSelectedState(
          color2: Color.fromARGB(255, 0, 49, 14),
          color1: Colors.white,
          fontcolor2: Colors.white,
          fontcolor1: Colors.black,
        ));
      }
    });

    on<ShowNextButton>((event, emit) {
      emit(ShowButtonState(showButton: event.showButton));
    });

    on<SaveUserDetails>((event, emit) async {
      emit(UserDetailsSavingState());
      CommonResponseModel response =
          await saveUserDetailsProvider.saveUserDetails(event.userDetailsModel);
      emit(UserDetailsSavedState(response: response));
    });
  }
}
