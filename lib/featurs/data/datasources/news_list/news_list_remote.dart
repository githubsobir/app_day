import 'dart:developer';

import 'package:app_day/core/urls.dart';
import 'package:app_day/featurs/data/models/news/news_list_model.dart';
import 'package:app_day/featurs/domain/entities/news_list.dart';
import 'package:dio/dio.dart';

class NewsListRemoteDataSource {
  final Dio dio;

  NewsListRemoteDataSource(this.dio);

  var header = MainUrl();

  Future<List<NewsList>> getNewsList() async {
    final response = await dio.get("${MainUrl.mainUrl}${MainUrl.newsList}",
        options: Options(headers: header.header()));
    try {
      return (response.data as List)
          .map((e) => NewsListModel.fromJson(e))
          .toList();
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
