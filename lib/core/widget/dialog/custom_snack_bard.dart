import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gift_shop/core/utils/theme.dart';


class CustomSnackbar {
  BuildContext context;

  CustomSnackbar(this.context);

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: AppColors.green
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void showErrorMessage(String error) {
    final snackbar = SnackBar(
      content: Text(error, style: TextStyle(color: Colors.white)),
      backgroundColor: AppColors.red
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}