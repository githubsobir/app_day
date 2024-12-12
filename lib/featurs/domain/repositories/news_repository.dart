
import 'package:app_day/featurs/domain/entities/news.dart';

abstract class NewsRepository {
  Future<List<News>> getNews();
}