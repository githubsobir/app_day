import 'package:app_day/featurs/domain/entities/send_mail.dart';

abstract class SendMessageRepository {
  Future<SendMessageResponseEntities> sendData(SendMessageEntities sendMessageEntities);
}
