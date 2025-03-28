import 'dart:developer';

import 'package:app_day/featurs/data/datasources/news_list/news_list_local.dart';
import 'package:app_day/featurs/data/datasources/news_list/news_list_remote.dart';
import 'package:app_day/featurs/data/repositories/news_list/news_list.dart';
import 'package:app_day/featurs/domain/entities/news_list.dart';
import 'package:app_day/featurs/domain/repositories/news_list.dart';
import 'package:app_day/featurs/domain/usecases/get_news_list.dart';
import 'package:app_day/featurs/presentation/providers/html_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final newsListProvider =
    StateNotifierProvider<NewsListNotifier, AsyncValue<List<NewsList>>>(
  (ref) => NewsListNotifier(ref.read(getNewsListUseCaseProvider)),
);

class NewsListNotifier extends StateNotifier<AsyncValue<List<NewsList>>> {
  final GetNewsListUseCase getNewsListUseCase;

  NewsListNotifier(this.getNewsListUseCase)
      : super(const AsyncValue.loading()) {
    fetchNewsList();
  }

  Future<void> fetchNewsList() async {
    try {
      final newList = await getNewsListUseCase();
      state = AsyncValue.data(newList);
    } catch (e) {
      log(e.toString());
      // state = AsyncValue.error(e);
    }
  }
}

final getNewsListUseCaseProvider = Provider<GetNewsListUseCase>((ref) {
  final repository = ref.read(newsListRepositoryProvider);
  return GetNewsListUseCase(repository);
});

final newsListRepositoryProvider = Provider<NewsListRepository>((ref) {
  final remoteDataSource = ref.read(newsListRemoteDataSourceProvider);
  final localDataSource = ref.read(newsListLocalDataSourceProvider);
  return NewsListRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
});


final newsListRemoteDataSourceProvider =
    Provider((ref) => NewsListRemoteDataSource(ref.read(dioProvider)));

final newsListLocalDataSourceProvider =
    Provider((ref) => NewsListLocalDataSource(ref.read(hiveBoxProvider)));
