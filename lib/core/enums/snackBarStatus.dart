import 'package:flutter/material.dart';

enum SnackBarStatus {
  error,
  success,
  info;

  Color getColor() {
    switch (this) {
      case SnackBarStatus.error:
        return Colors.red;
      case SnackBarStatus.success:
        return Colors.green;
      case SnackBarStatus.info:
        return Colors.grey[700]!;
    }
  }

}