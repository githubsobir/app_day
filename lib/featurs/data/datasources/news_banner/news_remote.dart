import 'dart:developer';

import 'package:app_day/core/urls.dart';
import 'package:app_day/featurs/data/models/news/news_model.dart';
import 'package:app_day/featurs/domain/entities/news.dart';
import 'package:dio/dio.dart';

class NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSource(this.dio);

  var header = MainUrl();

  Future<List<News>> getNews() async {
    final response =
        await dio.get("${MainUrl.mainUrl}${MainUrl.bannerNewsList}",
            options: Options(headers: header.header())
        );

    try {
      return (response.data as List).map((e) => NewsModel.fromJson(e)).toList();
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
