import 'dart:convert';
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
    log("${MainUrl.mainUrl}${MainUrl.htmlViewById}$idService");
    log(jsonEncode(header.header()));
    final response =
        await dio.get("${MainUrl.mainUrl}${MainUrl.htmlViewById}$idService",
            // "${MainUrl.mainUrl}${MainUrl.htmlViewById}$idService",
            options: Options(headers: header.header()));
    log(jsonEncode(response.data).toString());
    try {
      return HtmlModel.fromJson(response.data);
    } on DioException catch (e) {
      log("*****");
      log(e.toString());
      return HtmlModel.fromJson(jsonDecode("{\"content\":\"null\", \"updated_at\":\"2024-12-12 00:00\"}"));

    }
    catch(e){
      return HtmlModel.fromJson(jsonDecode("{\"content\":\"null\", \"updated_at\":\"2024-12-12 00:00\"}"));
    }
  }
}
