import 'package:app_day/featurs/presentation/providers/new_by_id.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/loading.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsOpen extends ConsumerStatefulWidget {
  final String newId;

  const NewsOpen({super.key, required this.newId});

  @override
  ConsumerState<NewsOpen> createState() => _NewsOpenState();
}

class _NewsOpenState extends ConsumerState<NewsOpen> {
  @override
  Widget build(BuildContext context) {
    final newsState = ref.watch(newByIdProvider(widget.newId));

    return Scaffold(
        backgroundColor: AppColors.white100,
        appBar: AppBar(
          title: Text(
            "Yangiliklar",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.appActiveColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: newsState.when(data: (data) {
          return SafeArea(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                Text(
                data.title,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: HtmlWidget(
                    data.content,
                    onTapUrl: (url) async {
                      final Uri ur = Uri.parse(url);
                      !await launchUrl(ur);
                      return true;
                    },
                    enableCaching: true,
                  ),
                ),
              )
              ],
                            ),
          ));
        }, error: (error, errorText) {
          return Center(child: Text(errorText.toString()));
        }, loading: () {
          return appLoading();
        })
    );
  }
}
