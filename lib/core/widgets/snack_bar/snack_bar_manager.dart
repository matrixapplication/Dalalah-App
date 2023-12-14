
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../di/injector.dart';

class SnackBarManager {
  static void showErrorSnackBar(String message) {
    BuildContext? context = injector<ServicesLocator>().appContext;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: context.errorColor,
      ),
    );
  }

  static void showSuccessSnackBar(String message) {
    BuildContext? context = injector<ServicesLocator>().appContext;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: context.onSecondaryContainer,
      ),
    );
  }
}