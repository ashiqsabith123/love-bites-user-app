part of 'otp_verification_bloc.dart';

sealed class OtpVerificationState {
  bool? showButton;

  OtpVerificationState({this.showButton});
}

final class OtpVerificationInitial extends OtpVerificationState {
  OtpVerificationInitial() : super(showButton: false);
}

final class ShowNextButton extends OtpVerificationState {
  ShowNextButton() : super(showButton: true);
}

final class DisableNextButton extends OtpVerificationState {
  DisableNextButton() : super(showButton: false);
}

final class VerifyOtpLoadingState extends OtpVerificationState {
  VerifyOtpLoadingState() : super(showButton: false);
}

final class OtpVerifiedState extends OtpVerificationState {
  final TokenResponseModel tokenResponse;
  OtpVerifiedState({required this.tokenResponse}) : super(showButton: false);
}
