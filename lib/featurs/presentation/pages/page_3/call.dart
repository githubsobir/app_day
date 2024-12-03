import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:flutter/material.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      appBar: AppBar(
          backgroundColor: AppColors.appActiveColor,
          title: Text("Ishonch telefonlari",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.white100)),
          iconTheme: IconThemeData(color: AppColors.white100)),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          color: AppColors.white100,
          child: ListTile(
            onTap: (){},
            leading: Text(
              "1",
              style: TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.bold),
            ),
            title: Text("(+998 71) 202-11-01"),
            trailing: Icon(Icons.phone),
          ),
        ),
      )),
    );
  }
}
