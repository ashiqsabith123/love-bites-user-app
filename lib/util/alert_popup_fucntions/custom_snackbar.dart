import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(
    BuildContext context, int type, String title, String message) {
  ContentType types = ContentType.success;

  switch (type) {
    case 1:
      types = ContentType.failure;
    case 2:
      types = ContentType.success;
    case 3:
      types = ContentType.warning;
    case 4:
      types = ContentType.help;
  }
  final snackBar = SnackBar(
    duration: const Duration(milliseconds: 1600),
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      messageFontSize: 16,
      contentType: types,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
