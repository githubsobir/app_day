import 'package:app_day/featurs/data/datasources/send_mail/send_message.dart';
import 'package:app_day/featurs/data/models/send_message_model/send_message_model.dart';
import 'package:app_day/featurs/domain/entities/send_mail.dart';
import 'package:app_day/featurs/domain/repositories/send_message_repo.dart';

class SendMailRepository implements SendMessageRepository {
  SendMessageDataSource sendMessageDataSource;

  SendMailRepository(this.sendMessageDataSource);

  @override
  Future<SendMessageResponseEntities> sendData(
      SendMessageEntities sendMessageEntities) async {
    SendMessageResponseModel sendMessageResponseModel =
        SendMessageResponseModel(
            mail: sendMessageEntities.mail,
            name: sendMessageEntities.name,
            phone: sendMessageEntities.phone,
            message: sendMessageEntities.message);

    SendMessageModel sendMessageModel =
        await sendMessageDataSource.sendData(sendMessageResponseModel);

    return SendMessageResponseEntities(
        mail: sendMessageModel.mail,
        name: sendMessageModel.name,
        phone: sendMessageModel.phone,
        message: sendMessageModel.message,
        createdAt: sendMessageModel.createdAt,
        updatedAt: sendMessageModel.updatedAt,
        id: sendMessageModel.id);
  }
}
