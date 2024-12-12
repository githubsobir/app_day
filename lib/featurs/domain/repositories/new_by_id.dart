
import 'package:app_day/featurs/domain/entities/news_by_id.dart';

abstract class NewByIdRepository {
  Future<NewById> getByIdNews();
}