import 'dart:developer';

import 'package:app_day/featurs/presentation/pages/login_page/login_page.dart';
import 'package:app_day/featurs/presentation/pages/main_page/html_page.dart';
import 'package:app_day/featurs/presentation/pages/main_page/service_page/botton_sheet.dart';
import 'package:app_day/featurs/presentation/pages/main_page/service_page/service_page.dart';
import 'package:app_day/featurs/presentation/pages/news/carousel_news.dart';
import 'package:app_day/featurs/presentation/pages/news/news_list.dart';
import 'package:app_day/featurs/presentation/providers/news_provider.dart';
import 'package:app_day/featurs/presentation/providers/post_provider.dart';
import 'package:app_day/featurs/presentation/widgets/choose_lang.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/image_logo.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/loading.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {

  Future<void> _onRefresh() async {
      log("onRefresh");
      ref.read(postProvider.notifier).fetchPosts();
      ref.watch(newsProvider.notifier).fetchNews();
  }


  @override
  Widget build(BuildContext context) {
    final postsState = ref.watch(postProvider);
    log("ui o'zgardi");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Standart ko'makchi",
          style:
              TextStyle(color: AppColors.white100, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: AppColors.white100),
        actions: [
          IconButton(
            icon: Icon(
              Icons.list_alt_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: NewsList(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
          ),
        ],
        backgroundColor: AppColors.appActiveColor,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 0,

        child: Column(
          children: [
            Container(
              color: AppColors.appActiveColor,
              child: Column(
                children: [
                  SizedBox(height: 60),
                  imageLogo(),
                  SizedBox(height: 40),
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: LoginPage(),
                      withNavBar: false,
                      // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  leading: Icon(
                    Icons.person,
                    color: AppColors.appActiveColor,
                  ),
                  title: Text(
                    "enterSystem".tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("http://forms.standart.uz"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: ChooseLang(windowId: "0"),
                      withNavBar: false,
                      // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  leading: Icon(
                    Icons.language,
                    color: AppColors.appActiveColor,
                  ),
                  title: Text(
                    "lang".tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                )
              ],
            )),

          ],
        ),
      ),
      body: postsState.when(
          loading: () => CustomMaterialIndicator(
              indicatorBuilder: (context, controller) {
                return CustomLoader();
              },
              onRefresh:_onRefresh,
              child: ListView(
                   shrinkWrap: true,
                  children:[
                    SizedBox(
                  height: AppSize.h(context: context)*0.8,
                  width: AppSize.w(context: context)*0.9,
                  child: appLoading())
                  ])),
          error: (err, stack) => Center(child: Text('Error: $err')),
          data: (post) {
            var list = post.data;
            return SafeArea(
              child: CustomMaterialIndicator(
                indicatorBuilder: (context, controller) {
                  return CustomLoader();
                },
                onRefresh:_onRefresh,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0,30 ),
                  child: ListView.builder(
                    itemCount: list.length + 1,
                    itemBuilder: (context, index) => index == 0
                        ? carouselMain(context: context, ref: ref)
                        : Container(
                      margin: EdgeInsets.all(10),
                      height: 210,
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: AppColors.grey.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(8)),
                              height: 50,
                              width: AppSize.w(context: context),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: SizedBox(
                                      width:
                                      AppSize.w(context: context) * 0.7,
                                      child: GestureDetector(
                                        onTap: () async {
                                          showGridView(
                                              index,
                                              list[index - 1].children,
                                              list[index - 1].name.toString(),
                                              context);
                                        },
                                        child: Text(
                                          list[index - 1].name,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      showGridView(
                                          index,
                                          list[index - 1].children,
                                          list[index - 1].name.toString(),
                                          context);
                                    },
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(right: 15),
                                      child: Text(
                                        "again".tr(),
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue.shade900),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: 8),
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: list[index - 1].children.length,
                              itemBuilder: (context, id2) => GestureDetector(
                                onTap: () {
                                  log(list[index - 1]
                                      .children[id2]
                                      .children
                                      .length
                                      .toString());
                                  list[index - 1]
                                      .children[id2]
                                      .children
                                      .isNotEmpty
                                      ? PersistentNavBarNavigator
                                      .pushNewScreen(
                                    context,
                                    screen: ServicePage(
                                        name: list[index - 1]
                                            .children[id2]
                                            .name,
                                        children: list[index - 1]
                                            .children[id2]
                                            .children),
                                    withNavBar: false,
                                    // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation:
                                    PageTransitionAnimation
                                        .cupertino,
                                  )
                                      : PersistentNavBarNavigator
                                      .pushNewScreen(
                                    context,
                                    screen: HtmlPage(
                                        idHtml: list[index - 1].children[id2]
                                            .id
                                            .toString(),
                                        titleName: list[index - 1]
                                            .name
                                            .toString()),
                                    withNavBar: false,
                                    // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation:
                                    PageTransitionAnimation
                                        .cupertino,
                                  );
                                },
                                child: Container(
                                  height: 170,
                                  width: 130,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 0.5,
                                            spreadRadius: 1.5)
                                      ],
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(3),
                                        child: list[index - 1]
                                            .children[id2]
                                            .icon
                                            .toString() !=
                                            "null"
                                            ? CachedNetworkImage(
                                          imageUrl: list[index - 1]
                                              .children[id2]
                                              .icon
                                              .toString(),
                                          height: 80,
                                          fit: BoxFit.fill,
                                          errorWidget:
                                              (context, url, error) =>
                                              Icon(Icons.image,
                                                  size: 30,
                                                  color: Colors.blue
                                                      .shade900),
                                        )
                                            : SizedBox(
                                          height: 80,
                                          child: Center(
                                            child: Icon(Icons.image,
                                                size: 30,
                                                color: Colors
                                                    .blue.shade900),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        list[index - 1]
                                            .children[id2]
                                            .name
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                        maxLines: 2,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );

          }),
    );
  }
}
