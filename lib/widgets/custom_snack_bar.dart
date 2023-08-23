import 'package:arabitac/core/resources/color.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar( {required String message,required BuildContext context,bool isError = true}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: isError ? Colors.red : primaryColor,
    content: Text(message,style: const TextStyle(color: Colors.white),),
  ));
}