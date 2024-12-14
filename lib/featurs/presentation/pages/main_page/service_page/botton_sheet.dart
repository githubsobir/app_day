import 'package:app_day/featurs/domain/entities/main_service.dart';
import 'package:app_day/featurs/presentation/pages/main_page/html_page.dart';
import 'package:app_day/featurs/presentation/pages/main_page/service_page/service_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

showGridView(int index, List<Datum> root, String name, BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    enableDrag: true,
    isScrollControlled: false,
    // backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.builder(
                  itemCount: root.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7),
                  itemBuilder: (context, ix) => GestureDetector(
                    onTap: () {
                      root[ix].children.isNotEmpty
                          ? PersistentNavBarNavigator.pushNewScreen(context,
                              screen: ServicePage(
                                  name: root[ix].name,
                                  children: root[ix].children),
                              withNavBar: false,
                              // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino)
                          : PersistentNavBarNavigator.pushNewScreen(context,
                              screen: HtmlPage(
                                  idHtml: root[ix].id.toString(),
                                  titleName: root[ix].name),
                              withNavBar: false,
                              // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino);
                    },
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 1.4,
                                spreadRadius: 1)
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: CachedNetworkImage(
                              imageUrl: root[ix].icon.toString(),
                              height: 80,
                              fit: BoxFit.fill,
                              errorWidget: (context, url, error) => Icon(
                                  Icons.image,
                                  size: 30,
                                  color: Colors.blue.shade900),
                            ),
                          ),
                          Text(
                            root[ix].name.toString(),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
