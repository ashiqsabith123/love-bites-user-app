import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

SnackBar errorResponseMessageSnackbar({required String message}) {
  return SnackBar(
    duration: const Duration(milliseconds: 2000),
    backgroundColor: Colors.red,
    content: Text(toBeginningOfSentenceCase(message) ?? message),
  );
}
