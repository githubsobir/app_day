import 'dart:developer';

import 'package:app_day/featurs/data/datasources/html_page/html_local_data_source.dart';
import 'package:app_day/featurs/data/datasources/html_page/html_remote_data_source.dart';
import 'package:app_day/featurs/data/models/html/html_model.dart';
import 'package:app_day/featurs/domain/repositories/html_repository.dart';

class HtmlRepositoryImpl implements HtmlRepository {
  String idHtml;
  final HtmlRemoteDataSource remoteDataSource;
  final HtmlLocalDataSource localDataSource;

  HtmlRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.idHtml});

  @override
  Future<HtmlModel> getHtml() async {
    try {
      final remotePosts = await remoteDataSource.getHtmls(idHtml);
      await localDataSource.cachePosts(htmls: remotePosts, idModel: idHtml);
      return remotePosts;
    } catch (e) {
      log(e.toString());
      return localDataSource.getHtmlModel(idHtml);
    }
  }
}
