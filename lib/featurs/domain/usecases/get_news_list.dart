import 'package:app_day/featurs/domain/entities/news_list.dart';
import 'package:app_day/featurs/domain/repositories/news_list.dart';

class GetNewsListUseCase {
  final NewsListRepository repository;

  GetNewsListUseCase(this.repository);

  Future<List<NewsList>> call() async {
    return await repository.getNewsList();
  }
}
