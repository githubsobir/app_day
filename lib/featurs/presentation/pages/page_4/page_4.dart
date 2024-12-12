import 'package:app_day/core/hive_saved/hive_saved.dart';
import 'package:app_day/featurs/presentation/widgets/choose_lang.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

class AccountPageShow extends ConsumerStatefulWidget {
  const AccountPageShow({super.key});

  @override
  ConsumerState<AccountPageShow> createState() => _AccountPageShowState();
}

class _AccountPageShowState extends ConsumerState<AccountPageShow> {
  var box = AppSaved();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white100,
        appBar: AppBar(
          backgroundColor: AppColors.appActiveColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.white100),
          title: Text(
            "account".tr(),
            style: TextStyle(
                color: AppColors.white100, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          Center(
                              child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: AppColors.appActiveColor,
                                shape: BoxShape.circle),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                               " box.profileImageUrl",
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors.white100)),
                                        child: Icon(Icons.error,
                                            color: AppColors.white100)),
                              ),
                            ),
                          )),
                          const SizedBox(height: 16),
                          Center(
                            child: Text(
                              "box.role",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Ism",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Familiya",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Center(
                              child: Text(
                            "email address",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.grey,
                            ),
                          )),
                          SizedBox(height: 20),
                          Card(
                            color: AppColors.white100,
                            child: ListTile(
                              leading: Icon(Icons.language,
                                  color: AppColors.appActiveColor),
                              title: Text("lang".tr(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: ChooseLang(
                                    windowId: "0",
                                  ),
                                  withNavBar: false,
                                  // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                            ),
                          ),
                          Card(
                            color: AppColors.white100,
                            child: ListTile(
                              leading: Icon(Icons.settings,
                                  color: AppColors.appActiveColor),
                              title: Text("settings".tr(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              onTap: () {},
                            ),
                          ),
                          Card(
                            color: AppColors.white100,
                            child: ListTile(
                              leading: Icon(Icons.help,
                                  color: AppColors.appActiveColor),
                              title: Text("support".tr(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              onTap: () {},
                            ),
                          ),
                          Card(
                            color: AppColors.white100,
                            child: ListTile(
                              leading: Icon(
                                Icons.logout,
                                color: AppColors.appActiveColor,
                              ),
                              title: Text("logOut".tr(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              onTap: () {
                                showDialogAppCaptcha(context);
                              },
                            ),
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, top: 10),
                                child: Text(
                                  "Version: 1.0.0",
                                  style: TextStyle(fontSize: 11),
                                ),
                              )),
                        ],
                      ),
                    )),
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }

  Future<void> showDialogAppCaptcha(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white100,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: AppColors.appActiveColor,
                          shape: BoxShape.circle),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: AssetImage(Assets.imagesLogo),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Center(
                  child: Text(
                    "logOut".tr(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                'ok'.tr(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.appActiveColor),
              ),
              onPressed: () {
                // zxc
                box.deleteAll();
                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => ChooseLang(windowId: "0")),
                  (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
