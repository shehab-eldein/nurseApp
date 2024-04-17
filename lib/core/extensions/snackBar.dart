import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';

extension CustomSnackBar on BuildContext {
  void showCustomSnackBar({
    required String text,
    Color backgroundColor = AppColors.red,
    Color textColor = Colors.white,
  }) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: backgroundColor,
      elevation: 5,
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
