import 'package:flutter/material.dart';

class AppSize {
  static double h({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }
  static double w({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }
}
