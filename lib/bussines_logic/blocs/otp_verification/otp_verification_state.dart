part of 'otp_verification_bloc.dart';

@immutable
sealed class OtpVerificationState {
  final bool showButton;

  OtpVerificationState({required this.showButton});
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
