import 'dart:developer';

import 'package:app_day/featurs/data/datasources/news_list/news_list_remote.dart';
import 'package:app_day/featurs/domain/entities/news_list.dart';
import 'package:app_day/featurs/domain/repositories/news_list.dart';

import '../../datasources/news_list/news_list_local.dart';

class NewsListRepositoryImpl implements NewsListRepository {
  final NewsListRemoteDataSource remoteDataSource;
  final NewsListLocalDataSource localDataSource;

  NewsListRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<List<NewsList>> getNewsList() async {
    try {
      final remoteNews = await remoteDataSource.getNewsList();
      await localDataSource.cacheNewsList(remoteNews);
      return remoteNews;
    } catch (e) {
      log(e.toString());
      return localDataSource.getCachedNews();
    }
  }
}
