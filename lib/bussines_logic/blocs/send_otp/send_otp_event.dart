part of 'send_otp_bloc.dart';

@immutable
sealed class SendOtpEvent {}

class SendOtp extends SendOtpEvent {
  final AuthOtpModel authOtpModel;
  SendOtp({required this.authOtpModel});
}
