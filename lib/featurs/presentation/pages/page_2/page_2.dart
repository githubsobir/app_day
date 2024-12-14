import 'dart:convert';
import 'dart:developer';

import 'package:app_day/featurs/presentation/pages/main_page/html_page.dart';
import 'package:app_day/featurs/presentation/pages/main_page/service_page/service_page.dart';
import 'package:app_day/featurs/presentation/providers/post_provider.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

class Page2 extends ConsumerStatefulWidget {
  const Page2({super.key});

  @override
  ConsumerState<Page2> createState() => _Page2State();
}

class _Page2State extends ConsumerState<Page2> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(filteredItemsProvider);

    return Scaffold(
      appBar: AppBar(
          title: Text("search".tr(),
              style: TextStyle(
                  color: AppColors.white100, fontWeight: FontWeight.bold)),
          backgroundColor: AppColors.appActiveColor,
          iconTheme: IconThemeData(color: AppColors.white100),
          centerTitle: true,
          elevation: 0),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: TextField(
                onTapOutside: (val) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  hintText: "search".tr(),
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w600, color: AppColors.grey),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 1, color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 1, color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 1, color: Colors.grey)),
                ),
                onChanged: (value) {
                  ref.read(searchQueryProvider.notifier).state = value;
                },
                onEditingComplete: () {},
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    margin: EdgeInsets.fromLTRB(15, 3, 15, 3),
                    color: AppColors.white100,
                    child: ListTile(
                      onTap: () {
                        log(jsonEncode(item).toString());
                        item.children.isNotEmpty
                            ? PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: ServicePage(
                                    name: item.name,
                                    children: item.children),
                                withNavBar: false,
                                // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              )
                            : PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: HtmlPage(
                                    idHtml: item.id.toString(),
                                    titleName: item.name.toString()),
                                withNavBar: false,
                                // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                      },
                      title: Text(
                        item.name,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget getData(dynamic data) {
    try {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            "noInformation".tr(),
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    } catch (ee) {
      return Center(child: appLoading());
    }
  }
}
