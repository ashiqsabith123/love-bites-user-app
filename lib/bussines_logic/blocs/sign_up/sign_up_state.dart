part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState(
      {required final bool isLoading,
      CommonResponseModel? response,
      SignUpModel? signupModel}) = _SignUpState;

  factory SignUpState.initial() => const SignUpState(isLoading: false);

  factory SignUpState.signUpLoadingState() =>
      const SignUpState(isLoading: true);
}
