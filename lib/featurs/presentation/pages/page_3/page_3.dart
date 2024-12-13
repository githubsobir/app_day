import 'package:app_day/featurs/presentation/pages/page_3/call.dart';
import 'package:app_day/featurs/presentation/pages/page_3/table_1.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List<String> _list = [
    "Fuqarolarni qabul qilish jadvali",
    "Ishonch telefonlari",
    "Bog'lanish",
    "Telefon raqamlari to‘g‘risida ma’lumot"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "help".tr(),
            style: TextStyle(
                color: AppColors.white100, fontWeight: FontWeight.bold),
          ),
        ),

        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: _list.length+1,
              itemBuilder: (context, index) =>
                  index != _list.length?
                  Card(
                  color: AppColors.white100,
                  child: ListTile(
                    onTap: () {
                      index == 0
                          ? {
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: Table1(),
                                  withNavBar: false,
                                  // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino)
                            }
                          : index == 1
                              ? {
                                  {
                                    PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: Call(),
                                        withNavBar: false,
                                        // OPTIONAL VALUE. True by default.
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.cupertino)
                                  }
                                }
                              : {};
                    },
                    leading: Text(
                      "${index + 1}",
                      style: TextStyle(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      _list[index],
                      style: TextStyle(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                  )):Container(height: 40, color: Colors.white, width: double.infinity,),
            ),
          ),
        ));
  }
}
