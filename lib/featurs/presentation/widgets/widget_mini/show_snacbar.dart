import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:flutter/material.dart';

sendMailMessage({required BuildContext context, required String text}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    backgroundColor: AppColors.appActiveColor,
  ));
}
