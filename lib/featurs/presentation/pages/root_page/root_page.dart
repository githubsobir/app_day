import 'package:app_day/core/hive_saved/hive_saved.dart';
import 'package:app_day/featurs/presentation/pages/main_page/main_page.dart';
import 'package:app_day/featurs/presentation/pages/main_page/state_main_page.dart';
import 'package:app_day/featurs/presentation/pages/search/page_2.dart';
import 'package:app_day/featurs/presentation/pages/help/page_3.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

class RootPage extends ConsumerStatefulWidget {
  final String passwordOnOff;

  const RootPage({super.key, required this.passwordOnOff});

  @override
  ConsumerState<RootPage> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage> {
  List<Widget> myPages() => [
        const MainPage(),
        const Page2(),
        const Page3(),
        // const AccountPageShow(),
      ];
  int index = 0;
  late PersistentTabController controller;

  @override
  initState() {
    super.initState();
    context.setLocale(Locale("uz", "UZ"));
    box.lang = "uz";
    controller = PersistentTabController(initialIndex: 0);
    // if (widget.passwordOnOff == "1") {
    //   screenLock123();
    //   timerM();
    // }
  }

  var box = AppSaved();
  bool boolFaceDetectFuncStart = false;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: myPages(),
      items: navBarsItems(),
      backgroundColor: AppColors.white100,
      controller: controller,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      hideNavigationBar: ref.watch(showBottomBar),
      screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.linear,
          duration: Duration(milliseconds: 300)),
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.appActiveColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 0.5)
        ],
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
        colorBehindNavBar: AppColors.appActiveColor,
      ),
      navBarStyle: NavBarStyle.style6,
      onItemSelected: (val) {},
      selectedTabScreenContext: (p0) {},
    );
  }
}

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.home,
        size: 30,
      ),
      title: "main".tr(),
      inactiveIcon: const Icon(
        Icons.home_outlined,
        size: 25,
      ),
      activeColorPrimary: AppColors.appActiveColor,
      inactiveColorSecondary: AppColors.white100,
      inactiveColorPrimary: AppColors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.manage_search_rounded,
        size: 30,
      ),
      title: "help".tr(),

      // textStyle:
      // const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      inactiveIcon: const Icon(
        Icons.manage_search_rounded,
        size: 25,
      ),
      // textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
      activeColorPrimary: AppColors.appActiveColor,
      inactiveColorSecondary: AppColors.white100,
      inactiveColorPrimary: AppColors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.help,
        size: 28,
      ),
      title: "help".tr(),
      // textStyle:
      // const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      inactiveIcon: const Icon(
        Icons.help_outline_outlined,
        size: 25,
      ),
      activeColorPrimary: AppColors.appActiveColor,
      inactiveColorSecondary: AppColors.white100,
      inactiveColorPrimary: AppColors.grey,
    ),
    // PersistentBottomNavBarItem(
    //   icon: const Icon(
    //     Icons.account_circle,
    //     size: 28,
    //   ),
    //   title: "profile".tr(),
    //   // textStyle:
    //   // const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    //
    //   inactiveIcon: const Icon(
    //     Icons.account_circle_outlined,
    //     size: 25,
    //   ),
    //   activeColorPrimary: AppColors.appActiveColor,
    //   inactiveColorSecondary: AppColors.white100,
    //   inactiveColorPrimary: AppColors.grey,
    // ),
  ];
}
