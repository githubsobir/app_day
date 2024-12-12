import 'package:app_day/featurs/domain/entities/main_service.dart';
import 'package:app_day/featurs/domain/repositories/post_repository.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<Post> call() async {
    return await repository.getPosts();
  }
}