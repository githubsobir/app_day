import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/size.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget appLoading() {
  return Center(
      child: SizedBox(
          width: 220,
          child: LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
              colors: [AppColors.appActiveColor, Colors.blueAccent],
              strokeWidth: 5,
              backgroundColor: Colors.transparent,
              pathBackgroundColor: Colors.transparent)));
}

Widget loadingShimmerCarousel() {
  return Padding(
    padding: EdgeInsets.all(15),
    child: FadeShimmer(
        height: 230,
        width: 230,
        radius: 20,
        highlightColor: Colors.grey.shade300,
        baseColor: Colors.white),
  );
}


Widget loadingShimmerListVertical() {
  return ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) =>
     Container(
       padding: EdgeInsets.all(2),
       margin: EdgeInsets.all(4),
       child: FadeShimmer(
          height: 220,
          width: AppSize.w(context: context)*0.95,
          radius: 20,
          highlightColor: Colors.grey.shade300,
          baseColor: Color(0xffE6E8EB)),
     ),
  );
}



class CustomLoader extends StatelessWidget {
   const CustomLoader({super.key});


  @override
  Widget build(BuildContext context) {



    return Center(

        child:LoadingIndicator(
          indicatorType: Indicator.ballClipRotateMultiple,
          colors: [Colors.blueAccent.shade700],
          strokeWidth: 4.0,
        ),
    );
  }
}