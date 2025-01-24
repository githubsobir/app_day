import 'package:app_day/featurs/presentation/pages/news/new_open.dart';
import 'package:app_day/featurs/presentation/providers/news_provider.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/loading.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

Widget carouselMain({required BuildContext context, required WidgetRef ref}) {
  final newsState = ref.watch(newsProvider);
  return newsState.when(data: (data) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 2),
        aspectRatio: 1.8,
        enlargeCenterPage: true,
      ),
      items: data.map((item) {
        return GestureDetector(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: NewsOpen(
                  newId: item.id.toString(), title: item.title.toString()),
              withNavBar: false,
              // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          child: Container(
            height: AppSize.h(context: context)*0.3,
            margin: const EdgeInsets.all(5.0),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: CachedNetworkImage(
                    imageUrl: item.url,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    errorWidget: (context, url, error) => Icon(Icons.image),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 1, 1, 0),
                        padding: EdgeInsets.fromLTRB(3, 1, 3, 0),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300.withOpacity(0.91),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          DateFormat('kk:mm dd-MM-yyyy').format(
                            DateTime.parse(item.updatedAt.toString()),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                          padding: EdgeInsets.fromLTRB(3, 1, 3, 0),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300.withOpacity(0.91),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding:  EdgeInsets.fromLTRB(3, 0, 3, 0),
                            child: Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );

  }, error: (error, errorText) {
    return Center(child: Text(errorText.toString()));
  }, loading: () {
    return loadingShimmerCarousel();
  });
}
