import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:love_bites_user_app/data/data_providers/send_otp/send_otp_provider.dart';

import 'package:love_bites_user_app/data/models/common_response_model/common_response_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_model/sign_up_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_otp_model/signup_otp_model.dart';


part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SendOtpDataProvider sendOtpDataProvider = SendOtpDataProvider();
  SignUpBloc() : super(SignUpState.initial()) {
    on<SendOtp>((event, emit) async {
      emit(SignUpState.signUpLoadingState());

      CommonResponseModel response =
          await sendOtpDataProvider.sendOtp(event.signUpOtpModel);

      // emit(SignUpState.sendOtpResponseState(signupOtpResponseModel: response));
      emit(SignUpState(
        isLoading: false,
        response: response,
      ));
    });
  }
}
