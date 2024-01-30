import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_bites_user_app/data/data_providers/get_notifications/get_notification_data_provider.dart';
import 'package:love_bites_user_app/data/models/notification_model/notification_model.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsInitial()) {
    GetNotificationProvider getNotification = GetNotificationProvider();
    on<GetNotification>((event, emit) async {
      emit(NotificationFetchingState());
      final resp = await getNotification.getNotification();

      print(resp.toJson());

      emit(NotificationFetchedState(resp: resp));
    });
  }
}
