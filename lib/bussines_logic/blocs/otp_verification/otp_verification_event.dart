part of 'otp_verification_bloc.dart';

@freezed
class OtpVerificationEvent with _$OtpVerificationEvent {
  const factory OtpVerificationEvent.validate() = Validate;
  const factory OtpVerificationEvent.resend() = Resend;
}
