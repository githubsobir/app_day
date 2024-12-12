
import 'dart:convert';

import 'package:app_day/featurs/data/models/html/html_model.dart';
import 'package:hive/hive.dart';

class HtmlLocalDataSource {
  final Box box;



  HtmlLocalDataSource(this.box);

  Future<void> cachePosts({required HtmlModel htmls, required String idModel}) async {
    await box.put('html$idModel',jsonEncode(htmls).toString());
  }

  HtmlModel getHtmlModel( String idModel) {
    final cachedData = box.get('html$idModel');
    return HtmlModel.fromJson(jsonDecode(cachedData));
  }
}