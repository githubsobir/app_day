import 'package:app_day/featurs/domain/entities/news.dart';
import 'package:app_day/featurs/domain/repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  Future<List<News>> call() async {
    return await repository.getNews();
  }
}
