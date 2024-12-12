import 'package:app_day/featurs/domain/entities/news_by_id.dart';
import 'package:app_day/featurs/domain/repositories/new_by_id.dart';

class GetNewByIdUseCase {
  final NewByIdRepository repository;

  GetNewByIdUseCase(this.repository);

  Future<NewById> call() async {
    return await repository.getByIdNews();
  }
}
