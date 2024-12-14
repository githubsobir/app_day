import 'package:app_day/featurs/presentation/pages/page_3/contact_info.dart';
import 'package:app_day/featurs/presentation/pages/page_3/sub_organ.dart';
import 'package:app_day/featurs/presentation/pages/page_3/table_1.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  // "tableSchedule"
  // "helLine"
  // "contacts"
  // "phoneNumbers"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.appActiveColor,
          title: Text(
            "help".tr(),
            style: TextStyle(
                color: AppColors.white100, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    color: AppColors.white100,
                    child: ListTile(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: Table1(),
                            withNavBar: false,
                            // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                            PageTransitionAnimation.cupertino);
                      },
                      leading: Text(
                        "1",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "tableSchedule".tr(),
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.grey,
                      ),
                    )),
                Card(
                    color: AppColors.white100,
                    child: ListTile(
                      onTap: () {
                        _makePhoneCall("1880");
                      },
                      leading: Text(
                        "2",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "helLine".tr(),
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("1880"),
                      trailing: Icon(
                        Icons.phone,
                        color: AppColors.grey,
                      ),
                    )),
                Card(
                    color: AppColors.white100,
                    child: ListTile(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: ContactInfo(titleName: "contacts".tr()),
                            withNavBar: false,
                            // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                            PageTransitionAnimation.cupertino);
                      },
                      leading: Text(
                        "3",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "contacts".tr(),
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.grey,
                      ),
                    )),
                Card(
                    color: AppColors.white100,
                    child: ListTile(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: SubOrgan(),
                            withNavBar: false,
                            // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                            PageTransitionAnimation.cupertino);
                      },
                      leading: Text(
                        "4",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "phoneNumbers".tr(),
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.grey,
                      ),
                    )),
                SizedBox(height: 20),
                Text(
                  "socialMedia".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 15),
                Center(
                  child: Container(
                    height: 58,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10)),
                    width: AppSize.w(context: context) * 0.9,
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(1),
                        scrollDirection: Axis.horizontal,
                        children: [
                          IconButton(
                              onPressed: () {
                                _launchInBrowser(
                                    Uri(scheme: 'https',
                                        host: "facebook.com",
                                        path: '/uzstandard'));
                              },
                              icon: Icon(FontAwesomeIcons.facebook,
                                  color: AppColors.appActiveColor, size: 40)),
                          SizedBox(width: 20),
                          IconButton(
                            onPressed: () {
                              // https://www.youtube.com/@uzstandard

                              _launchInBrowser(
                                  Uri(scheme: 'https',
                                      host: "youtube.com",
                                      path: '/@uzstandard'));
                            },
                            icon: Icon(FontAwesomeIcons.youtube,
                                size: 40, color: AppColors.appActiveColor),
                          ),
                          SizedBox(width: 20),
                          IconButton(
                            onPressed: () {
                              _launchInBrowser(
                                  Uri(scheme: 'https',
                                      host: "t.me",
                                      path: '/UzstandardChannel'));
                              // https://t.me/UzstandardChannel
                            },
                            icon: Icon(FontAwesomeIcons.telegram,
                                size: 40, color: AppColors.appActiveColor),
                          ),
                          SizedBox(width: 20),
                          IconButton(
                              onPressed: () {
                                // https://www./
                                _launchInBrowser(
                                    Uri(scheme: 'https',
                                        host: "instagram.com",
                                        path: '/uzstandard'));

                              },
                              icon: Icon(FontAwesomeIcons.instagram,
                                  size: 40, color: AppColors.appActiveColor)),

                          IconButton(
                              onPressed: () {
                                _launchInBrowser(
                                    Uri(scheme: 'https',
                                        host: "x.com",
                                        path: 'Uzstandard'));
                              },
                              icon: Icon(FontAwesomeIcons.twitter,
                                  size: 40, color: AppColors.appActiveColor))

                          // https://x.com/Uzstandard
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(thickness: 0.5,),

              ],
            ),
          ),
        ));
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }


  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }


}
