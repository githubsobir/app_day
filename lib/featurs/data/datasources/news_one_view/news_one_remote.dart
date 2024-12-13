import 'dart:developer';

import 'package:app_day/core/urls.dart';
import 'package:app_day/featurs/data/models/news/news_by_id_model.dart';
import 'package:app_day/featurs/domain/entities/news_by_id.dart';
import 'package:dio/dio.dart';

class NewByIdRemoteDataSource {
  final Dio dio;

  NewByIdRemoteDataSource(this.dio);

  var header = MainUrl();

  Future<NewById> getNews({required String newsId}) async {
    final response = await dio.get(
        "${MainUrl.mainUrl}${MainUrl.bannerWithId}$newsId",
        options: Options(headers: header.header()));
    try {
      return NewByIdModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
