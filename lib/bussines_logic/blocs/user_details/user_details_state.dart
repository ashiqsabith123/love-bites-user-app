part of 'user_details_bloc.dart';

@immutable
sealed class UserDetailsState {}

final class UserDetailsInitial extends UserDetailsState {}

final class LocationFetchedState extends UserDetailsState {
  final LocationResponseModel? locationResponseModel;
  LocationFetchedState({this.locationResponseModel});
}

final class GenderSelectedState extends UserDetailsState {
  final Color color1;
  final Color color2;

  final Color fontcolor1;
  final Color fontcolor2;

  GenderSelectedState({
    required this.color1,
    required this.color2,
    required this.fontcolor1,
    required this.fontcolor2,
  });
}

final class DateOfBirthFetchedState extends UserDetailsState {
  final DateOfBirthResponseModel dateOfBirthResponseModel;
  DateOfBirthFetchedState({required this.dateOfBirthResponseModel});
}

final class ShowButtonState extends UserDetailsState {
  final bool showButton;

  ShowButtonState({required this.showButton});
}
