import 'dart:math';

import 'package:app_day/featurs/data/models/main/generation_main.dart';
import 'package:app_day/featurs/presentation/pages/login_page/login_page.dart';
import 'package:app_day/featurs/presentation/pages/news/news.dart';
import 'package:app_day/featurs/presentation/pages/service_page/service_page.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {


  // List<String> list  = ["Texnik jihatdan tartibga solish",
  // "Standartlashtirish",
  //   "Metrologiya",
  //   "Sertifikatlashtirish",
  //   "Akkreditatsiya",
  //   "Eksport buyrosi",
  //   "Sifat",
  //   "Davlat nazorati",
  //   "Shtrix kodlar",
  //   "Ilmiy ishlar",
  //   "Kadrlarni qayta tayyorlash"
  //
  // ];
  final random = Random();

  List<Icon> icons = [
    Icon(Icons.euro, color: AppColors.appActiveColor, size: 80,),
    Icon(Icons.account_tree, color: AppColors.appActiveColor, size: 80,),
    Icon(Icons.add_card_rounded, color: AppColors.appActiveColor, size: 80,),
    Icon(Icons.add_chart_outlined, color: AppColors.appActiveColor, size: 80,),
    Icon(Icons.ad_units_outlined, color: AppColors.appActiveColor, size: 80,),
    Icon(CupertinoIcons.app_badge, color: AppColors.appActiveColor, size: 80,),
    Icon(Icons.holiday_village, color: AppColors.appActiveColor, size: 80,),
    Icon(Icons.web_sharp, color: AppColors.appActiveColor, size: 80,),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Standart ko'makchi",
            style: TextStyle(
                color: AppColors.white100, fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: AppColors.white100),
          leading: IconButton(
            icon: Icon(
              Icons.list_alt_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.account_box_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreen(context,
                    screen: const LoginPage(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino);
              },
            ),
          ],
          backgroundColor: AppColors.appActiveColor,
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: list.length+1,
            itemBuilder: (context, index) => index == 0
                ? carouselMain(context: context)
                : Container(
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    height: 200,
                    child: Column(
                      children: [
                        SizedBox(
                            height: 50,
                            width: AppSize.w(context: context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: SizedBox(
                                    width: AppSize.w(context: context) * 0.7,
                                    child: Text(
                                      list[index-1].name,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    // ref
                                    //     .read(showBottomBar.notifier)
                                    //     .update((state) => true);
                                    // await Future.delayed(Duration(milliseconds: 200));
                                    showGridView(index, list[index-1].root,
                                        list[index-1].name);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      "Yana",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade900),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 130,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: list[index-1].root.length,
                            itemBuilder: (context, id2) => GestureDetector(
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen:
                                      ServicePage(root: list[index-1].root[id2]),
                                  withNavBar: false,
                                  // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 0.5, color: Colors.grey)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    icons[random.nextInt(icons.length)],
                                    // Icon(
                                    //
                                    //   size: 80,
                                    //   color: Colors.blue.shade900,
                                    // ),
                                    Text(
                                      list[index-1].root[id2].subCategory.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                      maxLines: 1,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ));
  }

  showGridView(int index, List<Root> root, String name) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      backgroundColor: Colors.white,

      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: root.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemBuilder: (context, ix) => Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      icons[random.nextInt(icons.length)],
                      Text(
                        root[ix].subCategory.title,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      // )
      // .then(
      // (value) => ref.read(showBottomBar.notifier).update((state) => false)
    );
  }
}
