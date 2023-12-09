part of 'otp_verification_bloc.dart';

@immutable
sealed class OtpVerificationEvent {}

class NextButtonEnable extends OtpVerificationEvent {}

class NextButtonDisable extends OtpVerificationEvent {}
