import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:flutter/cupertino.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget appLoading() {
  return Center(
      child:CupertinoActivityIndicator());

      // LoadingAnimationWidget.fourRotatingDots(
      //     color: AppColors.appActiveColor, size: 90));
}

// Widget appLoadingNews({required BuildContext context, required double h}) {
//   return Center(
//     child: Shimmer.fromColors(
//       baseColor: Colors.grey[200]!,
//       highlightColor: Colors.grey[100]!,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Container(
//               height: h,
//               margin: EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                   color: AppColors.white100,
//                   borderRadius: BorderRadius.circular(20)),
//             ),
//           ),
//           const SizedBox(height: 10.0),
//         ],
//       ),
//     ),
//   );
// }
