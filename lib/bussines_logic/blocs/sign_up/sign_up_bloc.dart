import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:love_bites_user_app/data/data_providers/send_otp/send_otp_provider.dart';
import 'package:love_bites_user_app/data/data_providers/sign_up/sign_up_data_provider.dart';
import 'package:love_bites_user_app/data/models/sign_up_model/sign_up_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_otp_model/signup_otp_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_otp_model/signup_otp_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_otp_response_model/sign_up_otp_response_model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SendOtpDataProvider sendOtpDataProvider = SendOtpDataProvider();
  SignUpBloc() : super(SignUpState.initial()) {
    on<SendOtp>((event, emit) async {
      emit(SignUpState.signUpLoadingState());

      SignupOtpModel otpModel = SignupOtpModel(phone: event.signUpModel.phone);

      SignUpOtpResponseModel response =
          await sendOtpDataProvider.sendOtp(otpModel);

      print(response.message);

      // emit(SignUpState.sendOtpResponseState(signupOtpResponseModel: response));
      emit(SignUpState(isLoading: false, response: response));
    });
  }
}
