import 'dart:developer';

import 'package:app_day/featurs/data/datasources/main_page/post_local_data_source.dart';
import 'package:app_day/featurs/data/datasources/main_page/post_remote_data_source.dart';
import 'package:app_day/featurs/domain/entities/main_service.dart';
import 'package:app_day/featurs/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;

  PostRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Post> getPosts() async {
    try {
      final remotePosts = await remoteDataSource.getPosts();
      await localDataSource.cachePosts(remotePosts);
      return remotePosts;
    } catch (e) {
      log(e.toString());
      return localDataSource.getCachedPosts();
    }
  }
}