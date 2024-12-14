import 'dart:developer';

import 'package:app_day/featurs/presentation/providers/html_provider.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/loading.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class HtmlPage extends ConsumerStatefulWidget {
  final String idHtml;
  final String titleName;

  const HtmlPage({super.key, required this.idHtml, required this.titleName});

  @override
  ConsumerState<HtmlPage> createState() => _HtmlPageState();
}

class _HtmlPageState extends ConsumerState<HtmlPage> {
  @override
  void initState() {
    log(widget.idHtml);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final htmlsState = ref.watch(htmlProvider(widget.idHtml.toString()));
    return Scaffold(
      backgroundColor: AppColors.white100,
      appBar: AppBar(
        title: Text(
          widget.titleName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.appActiveColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SafeArea(
            child: htmlsState.when(data: (data) {
          return data.content.toString() != "null"
              ? SingleChildScrollView(

                  child: HtmlWidget(
                    data.content.toString(),
                    onLoadingBuilder: (context, element, loadingProgress) => SizedBox(
                      height: AppSize.h(context: context)*0.85,
                      width: AppSize.w(context: context)*0.9,
                      child: Align(
                        alignment: Alignment.center,
                        child: appLoading(),
                      ),
                    ),
                    onTapUrl: (url) async {
                      final Uri ur = Uri.parse(url);
                      !await launchUrl(ur);
                      return true;
                    },
                    enableCaching: true,
                  ),
                )
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("noInformation".tr()),
                      Text("ID => ${widget.idHtml}"),
                      SizedBox(height: 30),
                      MaterialButton(
                        height: 50,
                        minWidth: 200,
                        color: AppColors.appActiveColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "ok".tr(),
                          style: TextStyle(
                              color: AppColors.white100, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                );
        }, error: (error, errorText) {
          return Center(child: Text(errorText.toString()));
        }, loading: () {
          return Center(
            child: appLoading(),
          );
        })),
      ),
    );
  }
}

class FullScreenImageDialog extends StatelessWidget {
  final String imageUrl;

  const FullScreenImageDialog({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(imageUrl),
      // Display the image in full screen with zoom
      backgroundDecoration: BoxDecoration(
          color: Colors.black), // Black background for full-screen effect
    );
  }
}
