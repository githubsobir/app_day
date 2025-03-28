import 'dart:convert';
import 'dart:developer';

import 'package:app_day/featurs/data/datasources/main_page/post_local_data_source.dart';
import 'package:app_day/featurs/data/datasources/main_page/post_remote_data_source.dart';
import 'package:app_day/featurs/data/repositories/main_page/post_repository_impl.dart';
import 'package:app_day/featurs/domain/entities/main_service.dart';
import 'package:app_day/featurs/domain/repositories/post_repository.dart';
import 'package:app_day/featurs/domain/usecases/get_post.dart';
import 'package:app_day/featurs/presentation/providers/html_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

final postProvider = StateNotifierProvider.autoDispose<PostNotifier, AsyncValue<Post>>(
  (ref) => PostNotifier(ref.read(getPostsUseCaseProvider)),
);

class PostNotifier extends StateNotifier<AsyncValue<Post>> {
  final GetPostsUseCase getPostsUseCase;

  PostNotifier(this.getPostsUseCase) : super(const AsyncValue.loading()) {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final posts = await getPostsUseCase();
      state = AsyncValue.data(posts);
    } catch (e) {
      log(e.toString());
      // state = AsyncValue.error(e);
    }
  }
}

final getPostsUseCaseProvider = Provider<GetPostsUseCase>((ref) {
  final repository = ref.read(postRepositoryProvider);
  return GetPostsUseCase(repository);
});

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final remoteDataSource = ref.read(postRemoteDataSourceProvider);
  final localDataSource = ref.read(postLocalDataSourceProvider);
  return PostRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
});

final postRemoteDataSourceProvider =
    Provider((ref) => PostRemoteDataSource(ref.read(dioProvider)));
final postLocalDataSourceProvider =
    Provider((ref) => PostLocalDataSource(ref.read(hiveBoxProvider)));


final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredItemsProvider = Provider<List<Datum>>((ref) {
  final query = ref.watch(searchQueryProvider);

  final items = ref.read(postLocalDataSourceProvider);

  final searchItems = SearchItems();
  return searchItems(query, items.getCachedPostAllOneList());
});

class SearchItems {
  List<Datum> call(String query, List<Datum> items) {
    if (query.isEmpty) {
      return items;
    }
    log(jsonEncode(items).toString());
    return items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
