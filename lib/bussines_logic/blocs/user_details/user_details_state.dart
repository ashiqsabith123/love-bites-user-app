part of 'user_details_bloc.dart';

@immutable
sealed class UserDetailsState {}

final class UserDetailsInitial extends UserDetailsState {}

final class LocationFetchedState extends UserDetailsState {
  LocationResponseModel? locationResponseModel;
  LocationFetchedState({this.locationResponseModel});
}
