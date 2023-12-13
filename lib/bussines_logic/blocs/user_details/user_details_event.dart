part of 'user_details_bloc.dart';

@immutable
sealed class UserDetailsEvent {}

class GetLocation extends UserDetailsEvent {}

class GetDateOfBirth extends UserDetailsEvent {
  final DateOfBirthResponseModel dateOfBirthResponseModel;
  GetDateOfBirth({required this.dateOfBirthResponseModel});
}

class SelectGender extends UserDetailsEvent {
  final int id;
  SelectGender({required this.id});
}

class ShowNextButton extends UserDetailsEvent {
  final bool showButton;

  ShowNextButton({required this.showButton});
}
