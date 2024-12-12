import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:flutter/material.dart';

class SubServicePage extends StatefulWidget {
  const SubServicePage({super.key});

  @override
  State<SubServicePage> createState() => _SubServicePageState();
}

class _SubServicePageState extends State<SubServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appActiveColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Text(
          "Xizmat yaqin vaqtda ishga tushadi",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      )),
    );
  }
}
