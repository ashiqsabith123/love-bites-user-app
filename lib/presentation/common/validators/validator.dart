import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/user_details/user_details_bloc.dart';

String? phoneValidator(String? value) {
  print("valueeeeeeeeee $value");
  if (value == null || value.isEmpty) {
    return "Phone number required";
  } else if (value.length < 10) {
    return "Phone number must be 10 digits";
  }
}

bool isValidFullname = false;
bool isValidEmail = false;
bool isValidLocation = false;
bool isValidDOB = false;
bool isValidGender = false;

validator(String? value, int? id, BuildContext? context) {
  if (id == 1) {
    if (value != null && value.isNotEmpty) {
      isValidFullname = true;
    } else {
      isValidFullname = false;
    }
  }
  if (id == 2) {
    if (value != null &&
        value.isNotEmpty &&
        value.contains(RegExp(
          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
        ))) {
      isValidEmail = true;
    } else {
      isValidEmail = false;
    }
  }

  if (id == 3) {
    isValidLocation = true;
  }

  if (id == 4) {
    isValidDOB = true;
  }

  if (id == 5) {
    isValidGender = true;
  }

  if (isValidFullname &&
      isValidEmail &&
      isValidLocation &&
      isValidDOB &&
      isValidGender) {
    context!.read<UserDetailsBloc>().add(ShowNextButton(showButton: true));
  } else {
    context!.read<UserDetailsBloc>().add(ShowNextButton(showButton: false));
  }
}
