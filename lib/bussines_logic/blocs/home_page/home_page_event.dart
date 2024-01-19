part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class SelectPage extends HomePageEvent {
  final int index;

  SelectPage({required this.index});
}

class FetchMatches extends HomePageEvent {}

class MakeIntrest extends HomePageEvent {
  final int recieverID;

  MakeIntrest({required this.recieverID});
}
