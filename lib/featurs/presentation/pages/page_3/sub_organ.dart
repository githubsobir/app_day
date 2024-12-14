import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubOrgan extends StatefulWidget {
  const SubOrgan({super.key});

  @override
  State<SubOrgan> createState() => _SubOrganState();
}

class _SubOrganState extends State<SubOrgan> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.appActiveColor,
          elevation: 0,
          centerTitle: true,
          title: Text("phoneNumbers".tr(),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.white100)),
          iconTheme: IconThemeData(color: AppColors.white100)),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Table(
          border: TableBorder.all(borderRadius: BorderRadius.circular(5)),
          columnWidths: const {
            0: FlexColumnWidth(2), // Adjust column widths as needed
            1: FlexColumnWidth(2),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                  color: AppColors.appActiveColor,
                  borderRadius: BorderRadius.circular(5)),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("orgName".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("helLine".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("agent1".tr()),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                        onTap: () {
                          _makePhoneCall("712021101");
                        },
                        child: Text("(71)202-11-01", style: textStyleCall())),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("agent2".tr()),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                        onTap: () {
                          _makePhoneCall("781130112");
                        },
                        child: Text("(78)113-01-12", style: textStyleCall())),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("agent3".tr()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 5),
                      GestureDetector(
                          onTap: () {
                            _makePhoneCall("712020011");
                          },
                          child: Text("(71)202-00-11", style: textStyleCall())),
                      SizedBox(height: 25),
                      GestureDetector(
                          onTap: () {
                            _makePhoneCall("1138");
                          },
                          child: Text("(1138)", style: textStyleCall())),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("agent4".tr()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10),
                      GestureDetector(
                          onTap: () {
                            _makePhoneCall("712020011");
                          },
                          child: Text('(71)202-00-11', style: textStyleCall())),
                      SizedBox(height: 25),
                      GestureDetector(
                          onTap: () {
                            _makePhoneCall("1814");
                          },
                          child: Text("(1814)", style: textStyleCall()))
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("agent5".tr()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      GestureDetector(
                          onTap: () {
                            _makePhoneCall("712020011");
                          },
                          child: Text('(71)202-00-11', style: textStyleCall())),
                      SizedBox(height: 10),
                      GestureDetector(
                          onTap: () {
                            _makePhoneCall("1240");
                          },
                          child: Text("(1240)", style: textStyleCall()))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  TextStyle textStyleCall() {
    return TextStyle(color: Colors.blue.shade700);
  }
}
