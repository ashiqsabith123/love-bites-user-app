import 'package:bloc/bloc.dart';
import 'package:love_bites_user_app/data/data_providers/verify_otp/verify_otp_provider.dart';
import 'package:love_bites_user_app/data/models/token_response_model/token_response_model.dart';
import 'package:love_bites_user_app/data/models/verify_otp_model/verify_otp_model.dart';
import 'package:love_bites_user_app/data/secure_data/secure_data.dart';
import 'package:meta/meta.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  VerifyOtpDataProvider verifyOtpDataProvider = VerifyOtpDataProvider();
  OtpVerificationBloc() : super(OtpVerificationInitial()) {
    on<NextButtonEnable>((event, emit) {
      emit(ShowNextButton());
    });

    on<NextButtonDisable>((event, emit) {
      emit(DisableNextButton());
    });

    on<VerifyOtp>((event, emit) async {
      emit(VerifyOtpLoadingState());
      TokenResponseModel tokenResponse =
          await verifyOtpDataProvider.verifyOtp(event.verifyOtpModel);

      if (tokenResponse.status == 200) {
        await tokenStorage.write(
            key: 'token', value: tokenResponse.data?.token);
      }

      emit(OtpVerifiedState(tokenResponse: tokenResponse));
    });
  }
}
