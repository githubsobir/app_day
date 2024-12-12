import 'package:app_day/featurs/presentation/pages/main_page/service_page/botton_sheet.dart';
import 'package:app_day/featurs/presentation/pages/main_page/service_page/service_page.dart';
import 'package:app_day/featurs/presentation/pages/news/news.dart';
import 'package:app_day/featurs/presentation/providers/post_provider.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/image_logo.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/loading.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/size.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  @override
  Widget build(BuildContext context) {
    final postsState = ref.watch(postProvider);

    return Scaffold(
      backgroundColor: Colors.white,
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
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.appActiveColor,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
            child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              imageLogo(),
              SizedBox(height: 20),
              ListTile(
                title: Text(
                  "enterSystem".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("http://forms.standart.uz"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              )
            ],
          ),
        )),
      ),
      body: postsState.when(
          loading: () => appLoading(),
          error: (err, stack) => Center(child: Text('Error: $err')),
          data: (post) {
            var list = post.data;
            return SafeArea(
              child: ListView.builder(
                itemCount: list.length + 1,
                itemBuilder: (context, index) => index == 0
                    ? carouselMain(context: context, ref: ref)
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                        width:
                                            AppSize.w(context: context) * 0.7,
                                        child: Text(
                                          list[index - 1].name,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
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
                            SizedBox(height: 15),
                            SizedBox(
                              height: 130,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: list[index - 1].children.length,
                                itemBuilder: (context, id2) => GestureDetector(
                                  onTap: () {
                                    PersistentNavBarNavigator.pushNewScreen(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: list[index - 1].icon,
                                          height: 80,
                                          fit: BoxFit.fill,
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                        Text(
                                          list[index - 1]
                                              .children[id2]
                                              .name
                                              .toString(),
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
            );
          }),
    );
  }
}
