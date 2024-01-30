part of 'notifications_bloc.dart';

@immutable
sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationFetchingState extends NotificationsState {}

final class NotificationFetchedState extends NotificationsState {
  final NotificationModel resp;

  NotificationFetchedState({required this.resp});
}
