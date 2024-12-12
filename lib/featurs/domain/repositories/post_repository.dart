import 'package:app_day/featurs/domain/entities/main_service.dart';

abstract class PostRepository {
  Future<Post> getPosts();
}