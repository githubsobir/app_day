import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Table1 extends StatefulWidget {
  const Table1({super.key});

  @override
  State<Table1> createState() => _Table1State();
}

class _Table1State extends State<Table1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.appActiveColor,
          title: Text("tableSchedule".tr(),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.white100)),
          iconTheme: IconThemeData(color: AppColors.white100)),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(color: AppColors.white100),
          child: Table(
            border: TableBorder.all(borderRadius: BorderRadius.circular(8), color: Colors.grey.shade400),
            columnWidths: const {
              0: FlexColumnWidth(2), // Adjust column widths as needed
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2),
            },
            children: [
              // Table header
              TableRow(
                decoration: BoxDecoration(
                    color: AppColors.appActiveColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 15, 8, 15),
                    child: Text("position".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 15, 8, 15),
                    child: Text("nameFirstName".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 15, 8, 15),
                    child: Text("dayTime".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              // Sample data rows
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("director".tr()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("f1".tr()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("tuesdayTime".tr()),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("deputyDirectorFirst".tr()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("f2".tr()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("wednesdayTime".tr()),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("deputyDirector".tr()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("f3".tr()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("thursdayTime".tr()),
                  ),
                ],
              ),

              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("deputyDirector".tr()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("f4".tr()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("fridayTime".tr()),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
