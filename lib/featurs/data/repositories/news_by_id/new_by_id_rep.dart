import 'dart:developer';

import 'package:app_day/featurs/data/datasources/news_one_view/news_one_local.dart';
import 'package:app_day/featurs/data/datasources/news_one_view/news_one_remote.dart';
import 'package:app_day/featurs/domain/entities/news_by_id.dart';
import 'package:app_day/featurs/domain/repositories/new_by_id.dart';

class NewByIdRepositoryImpl implements NewByIdRepository {
  String idNewId;
  final NewByIdRemoteDataSource remoteDataSource;
  final NewByIdLocalDataSource localDataSource;

  NewByIdRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.idNewId});

  @override
  Future<NewById> getByIdNews() async {
    try {
      final remoteNews = await remoteDataSource.getNews(newsId: idNewId);
      await localDataSource.cacheNews(remoteNews, idNewId);
      return remoteNews;
    } catch (e) {
      log(e.toString());
      return localDataSource.getCachedNews(idNewId);
    }
  }
}
