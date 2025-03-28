import 'package:app_day/featurs/domain/entities/send_mail.dart';
import 'package:app_day/featurs/domain/repositories/send_message_repo.dart';

class SendMessageUsecase {
  SendMessageRepository sendMessageRepository;

  SendMessageUsecase({required this.sendMessageRepository});

  Future<SendMessageResponseEntities> call(
      SendMessageEntities sendMessageEntities) async {
    return await sendMessageRepository.sendData(sendMessageEntities);
  }
}
