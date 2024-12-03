import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget carouselMain(
    {required BuildContext context,}) {


  return  CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: true,
    ),
    items: imageSliders,
  );
}



final List<String> imgList = [
  "https://new.standart.uz/upload/image/photo_2024_12_02_15_50_49.jpg",
  "https://new.standart.uz/upload/image/photo_2024_12_02_15_51_09.jpg",
  "https://new.standart.uz/upload/image/photo_2024_12_02_22_11_19.jpg",
  "https://new.standart.uz/upload/image/inshot_20241129_152547970.jpg",
  "https://new.standart.uz/upload/image/photo_2024_11_28_11_49_39.jpg"
];
final List<Widget> imageSliders = imgList.map((item) {

  return Container(
    margin: const EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.network(item, fit: BoxFit.fitWidth, width: double.infinity),
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
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '0${imgList.indexOf(item)+1}-11-24',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}).toList();
