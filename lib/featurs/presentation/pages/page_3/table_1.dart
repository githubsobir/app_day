import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
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
      backgroundColor: AppColors.white100,
      appBar: AppBar(
        backgroundColor: AppColors.appActiveColor,
        title: Text("Fuqarolarni qabul qilish jadvali",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.white100)),
        iconTheme: IconThemeData(color: AppColors.white100)
      ),
      body: SafeArea(
          child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FlexColumnWidth(2), // Adjust column widths as needed
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2),
            },
            children: [
              // Table header
              TableRow(
                decoration: BoxDecoration(color: Colors.blueGrey),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Lavozimi',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('F.I.Sh.',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Qabul kunlari',
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
                    child: Text("Direktor"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Jumanazarov Akmal Ruzikulovich"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Seshanba 10:00 dan 12:00 gacha"),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Direktorning birinchi o‘rinbosari"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Abdukayumov Abdurauf Abdurashidovich"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Chorshanba 10:00 dan 12:00 gacha"),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Direktor o‘rinbosari"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Toxirov Odiljon Zoxidjonovich"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Payshanba 10:00 dan 12:00 gacha"),
                  ),
                ],
              ),

              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Direktor o‘rinbosari"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(' Mashanpin Timur Vasikovich'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Juma 10:00 dan 12:00 gacha"),
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
