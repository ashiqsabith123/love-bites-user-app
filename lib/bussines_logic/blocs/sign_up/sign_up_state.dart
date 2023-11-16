part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    required final bool isLoading,
  }) = _SignUpState;

  factory SignUpState.initial() => const SignUpState(isLoading: false);
  factory SignUpState.signUpLoadingState() =>
      const SignUpState(isLoading: true);

  factory SignUpState.signUpResponseState({required SignUpModel signUpModel}) =>
      const SignUpState(isLoading: false);
}
