import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

showCustomErrorAlertDalog(BuildContext context,String message, String title) {
  CoolAlert.show(
    context: context,

    type: CoolAlertType.error,
    text: message,
title: title
  );
}
