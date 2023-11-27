part of 'otp_verification_bloc.dart';

@freezed
class OtpVerificationState with _$OtpVerificationState {
  const factory OtpVerificationState({
    required final bool isLoading,
  }) = _OtpVerificationState;

  factory OtpVerificationState.intial() =>
      const OtpVerificationState(isLoading: false);

  

  
}
