import 'dart:developer';

import 'package:app_day/featurs/data/datasources/news/news_local.dart';
import 'package:app_day/featurs/data/datasources/news/news_remote.dart';
import 'package:app_day/featurs/domain/entities/news.dart';
import 'package:app_day/featurs/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;

  NewsRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<List<News>> getNews() async {
    try {
      final remoteNews = await remoteDataSource.getNews();
      await localDataSource.cacheNews(remoteNews);
      return remoteNews;
    } catch (e) {
      log(e.toString());
      return localDataSource.getCachedNews();
    }
  }

}