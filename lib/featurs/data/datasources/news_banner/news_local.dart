import 'dart:convert';

import 'package:app_day/featurs/data/models/news/news_model.dart';
import 'package:app_day/featurs/domain/entities/news.dart';
import 'package:hive/hive.dart';

class NewsLocalDataSource {
  final Box box;

  NewsLocalDataSource(this.box);

  Future<void> cacheNews(List<News> newsModel) async {
    await box.put('news_banner',jsonEncode(newsModel).toString());
  }

  List<News> getCachedNews() {
    final cachedData = box.get('news_banner');
    return (jsonDecode(cachedData) as List).map((e) => NewsModel.fromJson(e)).toList();
  }
}