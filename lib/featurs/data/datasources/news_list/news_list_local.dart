import 'dart:convert';

import 'package:app_day/featurs/data/models/news/news_list_model.dart';
import 'package:app_day/featurs/domain/entities/news_list.dart';
import 'package:hive/hive.dart';

class NewsListLocalDataSource {
  final Box box;

  NewsListLocalDataSource(this.box);

  Future<void> cacheNewsList(List<NewsList> newsModel) async {
    await box.put('newList', jsonEncode(newsModel).toString());
  }

  List<NewsList> getCachedNews() {
    final cachedData = box.get('newList');
    return (jsonDecode(cachedData) as List)
        .map((e) => NewsListModel.fromJson(e))
        .toList();
  }
}
