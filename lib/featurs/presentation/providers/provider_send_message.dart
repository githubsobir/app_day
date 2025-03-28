import 'package:app_day/featurs/data/datasources/send_mail/send_message.dart';
import 'package:app_day/featurs/data/repositories/send_mail_repo/send_mail_repo.dart';
import 'package:app_day/featurs/domain/entities/send_mail.dart';
import 'package:app_day/featurs/domain/usecases/send_message_usecase.dart';
import 'package:app_day/featurs/presentation/providers/html_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final newsListRemoteDataSourceProvider =
// Provider((ref) => NewsListRemoteDataSource(ref.read(dioProvider)));
final visibleTextMessageMail = StateProvider<bool>((ref) => true);

// final hiveBoxProvider = Provider((ref) => Hive.box('standartk'));
/// data source
final getDataSourceSendMessage =
    Provider((ref) => SendMessageDataSourceImpl(ref.read(dioProvider)));

/// data source impl
final getUsecaseSendMessage = Provider((ref) {
  final getDataSourceSend = ref.read(getDataSourceSendMessage);
  return SendMailRepository(getDataSourceSend);
});

/// domain impl
final getSendMessageUseCase = Provider<SendMessageUsecase>((ref) {
  final repository = ref.read(getUsecaseSendMessage);
  return SendMessageUsecase(sendMessageRepository: repository);
});

/// presentation
final setMessage =
    FutureProvider.family<SendMessageResponseEntities, SendMessageEntities>(
        (ref, data) async {
  final getSendMessUseCase = ref.read(getSendMessageUseCase);
  return await getSendMessUseCase.call(data);
});
