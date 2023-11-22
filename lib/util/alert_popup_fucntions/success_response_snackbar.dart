import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

SnackBar successResponseMessageSnackbar({required String message}) {
  return SnackBar(
    duration: const Duration(milliseconds: 2000),
    backgroundColor: Colors.green,
    content: Text(toBeginningOfSentenceCase(message) ?? message),
  );
}
