import 'package:app_day/featurs/domain/entities/news_list.dart';

abstract class NewsListRepository {
  Future<List<NewsList>> getNewsList();
}
