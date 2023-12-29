part of 'user_prefrences_bloc.dart';

@immutable
sealed class UserPrefrencesState {}

final class UserPrefrencesInitial extends UserPrefrencesState {}

final class PageChangedState extends UserPrefrencesState {
 

  PageChangedState();
}
