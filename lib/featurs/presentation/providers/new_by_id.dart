import 'dart:developer';

import 'package:app_day/featurs/data/datasources/news_one_view/news_one_local.dart';
import 'package:app_day/featurs/data/datasources/news_one_view/news_one_remote.dart';
import 'package:app_day/featurs/data/repositories/news_by_id/new_by_id_rep.dart';
import 'package:app_day/featurs/domain/entities/news_by_id.dart';
import 'package:app_day/featurs/domain/repositories/new_by_id.dart';
import 'package:app_day/featurs/domain/usecases/get_new_by_id.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final newByIdProvider =
    StateNotifierProvider.family<NewByIdNotifier, AsyncValue<NewById>, String>(
  (ref, idNew) => NewByIdNotifier(ref.read(getNewByIdUseCaseProvider(idNew))),
);

class NewByIdNotifier extends StateNotifier<AsyncValue<NewById>> {
  final GetNewByIdUseCase getNewByIdUseCase;

  NewByIdNotifier(this.getNewByIdUseCase) : super(const AsyncValue.loading()) {
    fetchNewById();
  }

  Future<void> fetchNewById() async {
    try {
      final newById = await getNewByIdUseCase();
      state = AsyncValue.data(newById);
    } catch (e) {
      log(e.toString());
      // state = AsyncValue.error(e);
    }
  }
}

final getNewByIdUseCaseProvider =
    Provider.family<GetNewByIdUseCase, String>((ref, idNewById) {
  final repository = ref.read(newByIdRepositoryProvider(idNewById));
  return GetNewByIdUseCase(repository);
});

final newByIdRepositoryProvider =
    Provider.family<NewByIdRepository, String>((ref, idById) {
  final remoteDataSource = ref.read(newByIdRemoteDataSourceProvider);
  final localDataSource = ref.read(newByIdLocalDataSourceProvider);
  return NewByIdRepositoryImpl(
    idNewId: idById,
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
});

final dioProvider = Provider((ref) => Dio());
final hiveBoxProvider = Provider((ref) => Hive.box('standartk'));

final newByIdRemoteDataSourceProvider =
    Provider((ref) => NewByIdRemoteDataSource(ref.read(dioProvider)));

final newByIdLocalDataSourceProvider =
    Provider((ref) => NewByIdLocalDataSource(ref.read(hiveBoxProvider)));
