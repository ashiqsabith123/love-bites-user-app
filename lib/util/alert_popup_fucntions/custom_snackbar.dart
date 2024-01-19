import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(
    BuildContext context, int type, String title, String message) {
  switch (type) {
    case 1:
      ElegantNotification.error(
        width: MediaQuery.sizeOf(context).width - 2,
        description: Text(message),
        title: Text(title),
      ).show(context);
    case 2:
      ElegantNotification.success(
        width: MediaQuery.sizeOf(context).width - 2,
        description: Text(message),
        title: Text(title),
      ).show(context);
    case 3:
      ElegantNotification.info(
        width: MediaQuery.sizeOf(context).width - 2,
        description: Text(message),
        title: Text(title),
      ).show(context);
  }
}
