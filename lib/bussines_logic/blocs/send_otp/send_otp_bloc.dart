import 'package:bloc/bloc.dart';
import 'package:love_bites_user_app/data/data_providers/send_otp/send_otp_provider.dart';
import 'package:love_bites_user_app/data/models/common_response_model/common_response_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_otp_model/signup_otp_model.dart';
import 'package:meta/meta.dart';

part 'send_otp_event.dart';
part 'send_otp_state.dart';

class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  SendOtpDataProvider sendOtpDataProvider = SendOtpDataProvider();
  SendOtpBloc() : super(SendOtpInitial()) {
    on<SendOtp>((event, emit) async {
      emit(SendOtpLoading());
      CommonResponseModel response =
          await sendOtpDataProvider.sendOtp(event.otpModel);
      emit(SendOtpResponseState(response));
    });
  }
}
