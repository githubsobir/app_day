import 'dart:developer';

import 'package:hive/hive.dart';

class AppSaved {
  static var box = Hive.box("standartk");


  /// delete All User Info
  deleteAll() {
    box.clear();
  }

  /// lang
  set lang(String userToken) {
    box.put("lang", userToken);
  }

  String get lang {
    try {
      return box.get("lang");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }



}