import 'dart:developer';

import 'package:app_day/core/urls.dart';
import 'package:app_day/featurs/data/models/html/html_model.dart';
import 'package:dio/dio.dart';

class HtmlRemoteDataSource {
  final Dio dio;
  var header = MainUrl();

  HtmlRemoteDataSource({
    required this.dio,
  });

  Future<HtmlModel> getHtmls(final String idService) async {
    log("${MainUrl.mainUrl}/content/index?tree_id=$idService");
    log("${MainUrl.mainUrl}/content/index?tree_id=161");

    final response = await dio.get(
        "${MainUrl.mainUrl}${MainUrl.htmlViewById}161",
        options: Options(headers: header.header()));

    // log((response.data).toString());
    try {
      return HtmlModel.fromJson(response.data);
    } on DioException catch (e) {
      log("*****");
      log(e.toString());
      throw Exception(e);
    }
  }
}
