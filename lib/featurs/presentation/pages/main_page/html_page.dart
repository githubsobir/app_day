import 'dart:developer';

import 'package:app_day/featurs/presentation/providers/html_provider.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/loading.dart';
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
        backgroundColor: AppColors.appActiveColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SafeArea(
            child: htmlsState.when(data: (data) {
          return SingleChildScrollView(
            child: HtmlWidget(
              data.content,
              onTapUrl: (url) async {
                final Uri ur = Uri.parse(url);
                !await launchUrl(ur);
                return true;
              },
              enableCaching: true,
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
