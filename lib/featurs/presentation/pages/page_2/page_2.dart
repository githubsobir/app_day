import 'dart:developer';

import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      appBar: AppBar(
          title:
          Text("search".tr(), style: TextStyle(color: AppColors.white100)),
          backgroundColor: AppColors.appActiveColor,
          iconTheme: IconThemeData(color: AppColors.white100),
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
                  prefixIcon: const Icon(Icons.search),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 0.3)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 0.3)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 0.3)
                  ),
                ),
                onEditingComplete: () {

                },
              ),
            ),
            Expanded(
              child: getData("(snapshot.data".toString())
            ),
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