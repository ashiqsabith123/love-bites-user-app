part of 'send_otp_bloc.dart';

@immutable
sealed class SendOtpState {
  final bool isLoading;

  SendOtpState({
    required this.isLoading,
  });
}

final class SendOtpInitial extends SendOtpState {
  SendOtpInitial() : super(isLoading: false);
}

final class SendOtpLoading extends SendOtpState {
  SendOtpLoading() : super(isLoading: true);
}

final class SendOtpResponseState extends SendOtpState {
  CommonResponseModel? sendOtpResponse;
  SendOtpResponseState(this.sendOtpResponse) : super(isLoading: false);
}
