part of 'user_prefrences_bloc.dart';

@immutable
sealed class UserPrefrencesEvent {}

class ChangeUserPrefrencePage extends UserPrefrencesEvent {}

class SaveUserPrefrences extends UserPrefrencesEvent {
  final UserPrefrencesModel userPrefrencesModel;

  SaveUserPrefrences({required this.userPrefrencesModel});
}
