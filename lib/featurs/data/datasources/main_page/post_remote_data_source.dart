import 'dart:developer';

import 'package:app_day/core/urls.dart';
import 'package:app_day/featurs/data/models/main/post_model.dart';
import 'package:dio/dio.dart';

class PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSource(this.dio);

  var header = MainUrl();

  Future<PostModel> getPosts() async {
    final response = await dio.get("${MainUrl.mainUrl}${MainUrl.mainPageUrl}",
        options: Options(headers: header.header()));
    log("getPosts()");
    try {
      return PostModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
