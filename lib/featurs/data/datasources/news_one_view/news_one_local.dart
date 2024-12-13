import 'dart:convert';

import 'package:app_day/featurs/data/models/news/news_by_id_model.dart';
import 'package:app_day/featurs/domain/entities/news_by_id.dart';
import 'package:hive/hive.dart';

class NewByIdLocalDataSource {
  final Box box;

  NewByIdLocalDataSource(this.box);

  Future<void> cacheNews(NewById newsModel, String id) async {
    await box.put('newById$id', jsonEncode(newsModel).toString());
  }

  NewById getCachedNews(String id) {
    final cachedData = box.get('newById$id');
    return NewByIdModel.fromJson(jsonDecode(cachedData));
  }
}
