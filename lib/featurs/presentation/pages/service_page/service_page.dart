import 'package:app_day/featurs/data/models/main/generation_main.dart';
import 'package:app_day/featurs/presentation/pages/service_page/sub_service_page.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

class ServicePage extends StatefulWidget {
  final Root root;

  const ServicePage({super.key, required this.root});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      appBar: AppBar(
        backgroundColor: AppColors.appActiveColor,
        title: Text(
          widget.root.subCategory.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
          child: SafeArea(
              child: Container(
        margin: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: widget.root.subCategory.text.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: (){

                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: SubServicePage(),
                  withNavBar: false,
                  // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation:
                  PageTransitionAnimation.cupertino,
                );
              },
              leading: Text("${index + 1}"),
              title: Text(widget.root.subCategory.text[index].name1),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ),
      ))),
    );
  }
}
