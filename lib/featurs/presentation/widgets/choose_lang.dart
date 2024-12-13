import 'dart:developer';

import 'package:app_day/core/hive_saved/hive_saved.dart';
import 'package:app_day/featurs/presentation/pages/root_page/root_page.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/image_logo.dart';
import 'package:app_day/generated/assets.dart';
import 'package:app_day/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

class ChooseLang extends StatefulWidget {
  final String windowId;

  const ChooseLang({super.key, required this.windowId});

  @override
  State<ChooseLang> createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  var box = AppSaved();

  onTapButtons({required String langMini, required String langBig}) {
    try {
      context.setLocale(Locale(langMini, langBig));
      box.lang = langMini;
      if (widget.windowId == "0") {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: MyApp(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => RootPage(passwordOnOff: ""),),
          (route) => false
        );
      } else if (widget.windowId == "1") {

        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => RootPage(passwordOnOff: "0",),),
                (route) => false
        );
      }
    } catch (e) {
      log("onTapButtons");
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      appBar: AppBar(
        backgroundColor: AppColors.appActiveColor,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.white100),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            imageLogo(),
            SizedBox(height: 15),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "STANDART KO'MAKCHI\n MOBIL ILOVASI",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.appActiveColor,
                      fontSize: 17),
                )),
            Spacer(),
            Container(
              margin: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "chooseLang".tr(),
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.appActiveColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      color: AppColors.white100,
                      child: ListTile(
                        onTap: () {
                          onTapButtons(langMini: "uz", langBig: "UZ");
                        },
                        leading: Image.asset(
                          Assets.imagesFlagUzb,
                          height: 50,
                        ),
                        title: const Text(
                          "O'zbek",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: AppColors.appActiveColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Card(
                      color: AppColors.white100,
                      child: ListTile(
                        onTap: () {
                          onTapButtons(langMini: "ru", langBig: "RU");
                        },
                        leading: Image.asset(
                          Assets.imagesFlagRu,
                          height: 50,
                        ),
                        title: const Text(
                          "Русский",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: AppColors.appActiveColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Card(
                      color: AppColors.white100,
                      child: ListTile(
                        onTap: () {
                          onTapButtons(langMini: "en", langBig: "EN");
                        },
                        leading: Image.asset(
                          Assets.imagesFlagEng,
                          height: 50,
                        ),
                        title: const Text(
                          "English",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: AppColors.appActiveColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
