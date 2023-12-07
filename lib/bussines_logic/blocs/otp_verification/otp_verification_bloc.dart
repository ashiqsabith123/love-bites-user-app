import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:love_bites_user_app/data/data_providers/verify_otp_and_signup/verify_otp_and_signup.dart';
import 'package:love_bites_user_app/data/models/common_response_model/common_response_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_model/sign_up_model.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';
part 'otp_verification_bloc.freezed.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  VerifyOtpAndSignUpDataProvider verifyOtpAndSignUpDataProvider =
      VerifyOtpAndSignUpDataProvider();
  OtpVerificationBloc() : super(OtpVerificationState.intial()) {
    on<Validate>((event, emit) async {
      emit(OtpVerificationState.verifyOtpLoadingState());

      CommonResponseModel response = await verifyOtpAndSignUpDataProvider
          .verifyOtpAndSignUp(event.signUpModel);

      // emit(OtpVerificationState.verifyOtpResponseState(response: response));
      emit(OtpVerificationState(isLoading: false, response: response));
    });
  }
}
