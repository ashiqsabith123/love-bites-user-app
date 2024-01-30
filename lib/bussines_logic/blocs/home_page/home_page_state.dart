part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

final class PageSelectedState extends HomePageState {
  final int index;
  PageSelectedState({required this.index});
}

final class FetchingMatches extends HomePageState {}

final class MatchesFetched extends HomePageState {
  final MatchResponseModel resp;
  final List<List<Widget>> images;

  MatchesFetched({required this.resp, required this.images});
}

final class MadeIntrest extends HomePageState {
  CommonResponseModel responseModel;

  MadeIntrest({required this.responseModel});
}

final class MakingIntrest extends HomePageState {}
