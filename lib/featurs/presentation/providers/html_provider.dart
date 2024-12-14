import 'dart:developer';

import 'package:app_day/featurs/data/datasources/html_page/html_local_data_source.dart';
import 'package:app_day/featurs/data/datasources/html_page/html_remote_data_source.dart';
import 'package:app_day/featurs/data/repositories/html_page/html_repository_impl.dart';
import 'package:app_day/featurs/domain/entities/html_model.dart';
import 'package:app_day/featurs/domain/repositories/html_repository.dart';
import 'package:app_day/featurs/domain/usecases/get_html.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final htmlProvider =
    StateNotifierProvider.autoDispose.family<HtmlNotifier, AsyncValue<Htmls>, String>(
  (ref, idHtml) => HtmlNotifier(ref.read(getPostsUseCaseProvider(idHtml))),
);



class HtmlNotifier extends StateNotifier<AsyncValue<Htmls>> {
  final GetHtmlUseCase getHtmlUseCase;

  HtmlNotifier(this.getHtmlUseCase) : super(const AsyncValue.loading()) {
    fetchHtml();
  }

  Future<void> fetchHtml() async {
    try {
      final posts = await getHtmlUseCase();
      state = AsyncValue.data(posts);
    } catch (e) {
      log(e.toString());
      // state = AsyncValue.error(e);
    }
  }
}


final getPostsUseCaseProvider =
    Provider.family<GetHtmlUseCase, String>((ref, idHtml) {
  final repository = ref.read(postRepositoryProvider(idHtml));
  return GetHtmlUseCase(repository);
});

final postRepositoryProvider =
    Provider.family<HtmlRepository, String>((ref, idHtml) {
  final remoteDataSource = ref.read(htmlRemoteDataSourceProvider);
  final localDataSource = ref.read(htmlLocalDataSourceProvider);
  return HtmlRepositoryImpl(
    idHtml: idHtml,
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
});

final dioProvider = Provider((ref) => Dio());
final hiveBoxProvider = Provider((ref) => Hive.box('standartk'));

final htmlRemoteDataSourceProvider =
    Provider((ref) => HtmlRemoteDataSource(dio: ref.read(dioProvider)));

final htmlLocalDataSourceProvider =
    Provider((ref) => HtmlLocalDataSource(ref.read(hiveBoxProvider)));
