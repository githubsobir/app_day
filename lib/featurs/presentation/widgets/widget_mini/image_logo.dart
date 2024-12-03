import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/generated/assets.dart';
import 'package:flutter/material.dart';

Widget imageLogo(){
  return    Center(
      child: Container(
        width: 140,
        height: 140,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white100,
            border: Border.all(width: 1, color: AppColors.black50)),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            Assets.imagesLogo,
            width: 240,
            height: 240,
          ),
        ),
      ));
}