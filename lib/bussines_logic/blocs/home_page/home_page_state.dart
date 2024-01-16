part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

final class PageSelectedState extends HomePageState {
  final int index;
  PageSelectedState({required this.index});
}

final class FetchingMatches extends HomePageState{}
