import 'package:app_day/featurs/presentation/pages/news/new_open.dart';
import 'package:app_day/featurs/presentation/providers/news_provider.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

Widget carouselMain({required BuildContext context, required WidgetRef ref}) {
  final newsState = ref.watch(newsProvider);
  return GestureDetector(
      onTap: () {},
      child: newsState.when(data: (data) {
        return CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: data.map((item) {
            return GestureDetector(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: NewsOpen(
                    newId: item.id.toString(),
                  ),
                  withNavBar: false,
                  // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: item.url,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        errorWidget: (context, url, error) => Icon(Icons.image),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              DateFormat('kk:mm dd-MM-yyyy').format(
                                  DateTime.parse(item.updatedAt.toString())),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }, error: (error, errorText) {
        return Center(child: Text(errorText.toString()));
      }, loading: () {
        return appLoading();
      }));
}

final List<String> imgList = [
  "https://new.standart.uz/upload/image/photo_2024_12_02_15_50_49.jpg",
  "https://new.standart.uz/upload/image/photo_2024_12_02_15_51_09.jpg",
  "https://new.standart.uz/upload/image/photo_2024_12_02_22_11_19.jpg",
  "https://new.standart.uz/upload/image/inshot_20241129_152547970.jpg",
  "https://new.standart.uz/upload/image/photo_2024_11_28_11_49_39.jpg"
];
