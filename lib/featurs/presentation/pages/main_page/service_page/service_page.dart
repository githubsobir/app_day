import 'package:app_day/featurs/domain/entities/main_service.dart';
import 'package:app_day/featurs/presentation/pages/main_page/html_page.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

class ServicePage extends StatefulWidget {
  final List<Datum> children;
  final String name;

  const ServicePage({super.key, required this.children, required this.name});

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
          widget.name.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
          child: SafeArea(
              child: Container(
        margin: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: widget.children.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: () {
                widget.children[index].children.isEmpty
                    ? PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: HtmlPage(
                            idHtml: widget.children[index].id.toString(),
                            titleName: widget.children[index].name.toString()),
                        withNavBar: false,
                        // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      )
                    : PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: ServicePage(
                            name: widget.children[index].name,
                            children: widget.children[index].children),
                        withNavBar: false,
                        // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
              },
              leading: Text("${index + 1}"),
              title: Text(widget.children[index].name.toString()),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ),
      ))),
    );
  }
}
