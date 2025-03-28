import 'dart:developer';

import 'package:app_day/featurs/data/datasources/news_banner/news_local.dart';
import 'package:app_day/featurs/data/datasources/news_banner/news_remote.dart';
import 'package:app_day/featurs/data/repositories/news/news.dart';
import 'package:app_day/featurs/domain/entities/news.dart';
import 'package:app_day/featurs/domain/repositories/news_repository.dart';
import 'package:app_day/featurs/domain/usecases/get_news.dart';
import 'package:app_day/featurs/presentation/providers/html_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final newsProvider =
    StateNotifierProvider.autoDispose<NewsNotifier, AsyncValue<List<News>>>(
        (ref) => NewsNotifier(ref.read(getNewsUseCase)));

class NewsNotifier extends StateNotifier<AsyncValue<List<News>>> {
  final GetNewsUseCase getNewsUseCases;

  NewsNotifier(this.getNewsUseCases) : super(const AsyncValue.loading()) {
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final news = await getNewsUseCases();
      state = AsyncValue.data(news);
    } catch (e) {
      log(e.toString());
      // state = AsyncValue.error(e);
    }
  }
}

final getNewsUseCase = Provider<GetNewsUseCase>((ref) {
  final repository = ref.read(newsRepositoryProvider);
  return GetNewsUseCase(repository);
});

final newsRemoteDataSourceProvider =
    Provider((ref) => NewsRemoteDataSource(ref.read(dioProvider)));
final newsLocalDataSourceProvider =
    Provider((ref) => NewsLocalDataSource(ref.read(hiveBoxProvider)));


final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final remoteDataSource = ref.read(newsRemoteDataSourceProvider);
  final localDataSource = ref.read(newsLocalDataSourceProvider);
  return NewsRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
});
