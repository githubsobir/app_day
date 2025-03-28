import 'dart:io';

import 'package:app_day/core/hive_saved/hive_saved.dart';
import 'package:app_day/featurs/presentation/pages/main_page/sent_message/sent_message.dart';
import 'package:app_day/featurs/presentation/pages/root_page/root_page.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("standartk");

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.appActiveColor, // navigation bar color
    statusBarColor: AppColors.appActiveColor, // status bar color
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('kk', 'KK'),
          Locale('ru', 'RU'),
          Locale('uz', 'UZ'),
          Locale('en', 'EN'),
        ],
        path: 'assets/lang',
        fallbackLocale: const Locale('uz', 'UZ'),
        child: ProviderScope(child: MyApp()),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var box = AppSaved();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.appActiveColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness:
          Brightness.dark, // Light or dark text/icons in the status bar
    ));

    return ConnectionNotifier(
        connectionNotificationOptions: const ConnectionNotificationOptions(
            height: 50,
            alignment: Alignment.topCenter,
            disconnectedText: "Internet",
            connectedText: "Internet"),
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // navigatorKey: navigatorKey,
          theme: ThemeData(
              fontFamily: "Nunito",
              appBarTheme: AppBarTheme(
                backgroundColor: AppColors.appActiveColor,
              )),
          debugShowCheckedModeBanner: false,
          home: mainPage(),
        )); //RootPage()
  }

  Widget mainPage() {
    if (box.lang == "-" || box.lang.isEmpty) {
      return RootPage(passwordOnOff: "1");
      // return ChooseLang(windowId: "0");
    } else {
      return RootPage(passwordOnOff: "1");
    }
  }
}
