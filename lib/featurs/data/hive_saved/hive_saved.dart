import 'dart:developer';

import 'package:hive/hive.dart';

class AppSaved {
  static var box = Hive.box("turin");


  /// delete All User Info

  deleteUserInfo(){

    box.delete("newsList");
    box.delete("lang");
    box.delete("token");
    box.delete("userId");
    box.delete("passport");
    box.delete("pnfl");
    box.delete("role");
    box.delete("profileImageUrl");
    box.delete("profileImageUrlSmall");
    box.delete("username");
    box.delete("faceIdDateDay");
    box.delete("localPassword");
    box.delete("faceId");
    box.delete("checkWallet");
    box.delete("walletId");
    box.delete("tracName");

  }


  ///faceIdDateDay
  set faceIdDateDay(String userToken) {
    box.put("faceIdDateDay", userToken);
  }

  String get faceIdDateDay {
    try {
      return box.get("faceIdDateDay");
    } catch (e) {
      log(e.toString());
      return "1";
    }
  }

  ///Today Day
  set faceToday(String userToken) {
    box.put("faceToday", userToken);
  }

  String get faceToday {
    try {
      return box.get("faceToday");
    } catch (e) {
      log(e.toString());
      return "1";
    }
  }


  /// faceIdQolganKun Day
  set faceIdQolganKun(String userToken) {
    box.put("faceIdQolganKun", userToken);
  }

  String get faceIdQolganKun {
    try {
      return box.get("faceIdQolganKun");
    } catch (e) {
      log(e.toString());
      return "1";
    }
  }

  /// faceIdDateMonth
  set faceIdDateMonth(String userToken) {
    box.put("faceIdDateMonth", userToken);
  }

  String get faceIdDateMonth {
    try {
      return box.get("faceIdDateMonth");
    } catch (e) {
      log(e.toString());
      return "12";
    }
  }


  /// face id
  set faceId(String userToken) {
    box.put("faceId", userToken);
  }

  String get faceId {
    try {
      return box.get("faceId");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

  /// news
  set newsList(String userToken) {
    box.delete("newsList");
    box.put("newsList", userToken);
  }

  String get newsList {
    try {
      return box.get("newsList");
    } catch (e) {
      log(e.toString());
      return "-";
    }
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

  /// user

  set userToken(String userToken) {
    box.put("token", userToken);
  }

  String get userToken {
    try {
      return box.get("token");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

  set userId(String userToken) {
    box.put("userId", userToken);
  }

  String get userId {
    try {
      return box.get("userId");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

  set username(String userToken) {
    box.put("username", userToken);
  }

  String get username {
    try {
      return box.get("username");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

  ///
  set firstname(String userToken) {
    box.put("firstname", userToken);
  }

  String get firstname {
    try {
      return box.get("firstname");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

//
  set fullName(String userToken) {
    box.put("fullName", userToken);
  }

  String get fullName {
    try {
      return box.get("fullName");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

  //
  set email(String userToken) {
    box.put("email", userToken);
  }

  String get email {
    try {
      return box.get("email");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

  //
  set profileImageUrl(String userToken) {
    box.put("profileImageUrl", userToken);
  }

  String get profileImageUrl {
    try {
      return box.get("profileImageUrl");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

  set profileImageUrlSmall(String userToken) {
    box.put("profileImageUrlSmall", userToken);
  }

  String get profileImageUrlSmall {
    try {
      return box.get("profileImageUrlSmall");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }


  //
  set passport(String userToken) {
    box.put("passport", userToken);
  }

  String get passport {
    try {
      return box.get("passport");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

  /// pnfl
  set pnfl(String userToken) {
    box.put("pnfl", userToken);
  }

  String get pnfl {
    try {
      return box.get("pnfl");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

  // role
  set role(String userToken) {
    box.put("role", userToken);
  }

  String get role {
    try {
      return box.get("role");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }
//
// phone
  set phone(String userToken) {
    box.put("phone", userToken);
  }

  String get phone {
    try {
      return box.get("phone");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }


  // localPassword
  set localPassword(String userToken) {
    box.put("localPassword", userToken);
  }

  String get localPassword {
    try {
      return box.get("localPassword");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

  // localPasswordOn
  set localPasswordOn(String userToken) {
    box.put("localPasswordOn", userToken);
  }

  String get localPasswordOn {
    try {
      return box.get("localPasswordOn");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

  // localPassword on off switch
  set localPasswordSwitch(String userToken) {
    box.put("localPasswordSwitch", userToken);
  }

  String get localPasswordSwitch {
    try {
      return box.get("localPasswordSwitch");
    } catch (e) {
      log(e.toString());
      return "-";
    }
  }

  /// check wallet
  set checkWallet(String userToken) {
    box.put("checkWallet", userToken);
  }

  String get checkWallet {
    try {
      return box.get("checkWallet");
    } catch (e) {
      log(e.toString());
      return "0";
    }
  }
  /// save wallet_id
  set walletId(String userToken) {
    box.put("walletId", userToken);
  }

  String get walletId {
    try {
      return box.get("walletId");
    } catch (e) {
      log(e.toString());
      return "-1";
    }
  }

  /// tracName wallet_id
  set tracName(String userToken) {
    box.put("tracName", userToken);
  }

  String get tracName {
    try {
      return box.get("tracName");
    } catch (e) {
      log(e.toString());
      return "-1";
    }
  }


}
