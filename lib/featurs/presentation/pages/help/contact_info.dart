import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatefulWidget {
  final String titleName;

  const ContactInfo({super.key, required this.titleName});

  @override
  State<ContactInfo> createState() => _CallState();
}

class _CallState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      appBar: AppBar(
          backgroundColor: AppColors.appActiveColor,
          centerTitle: true,
          title: Text(widget.titleName,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.white100)),
          iconTheme: IconThemeData(color: AppColors.white100)),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: AppColors.white100,
                margin: EdgeInsets.all(5),

                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  child: Text("address".tr()),
                )
              ),
              Card(
                  color: AppColors.white100,
                  margin: EdgeInsets.all(5),

                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    child: Text("phone".tr()),
                  )
              ),
              Card(
                  color: AppColors.white100,
                  margin: EdgeInsets.all(5),

                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    child: Text("work".tr()),
                  )
              ),
              Card(
                  color: AppColors.white100,
                  margin: EdgeInsets.all(5),

                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    child: Text("mailAddress".tr()),
                  )
              ),
            ],
          ),
        ),
      )),
    );
  }
}
