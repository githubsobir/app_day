import 'package:app_day/featurs/domain/entities/send_mail.dart';

class SendMessageResponseModel extends SendMessageEntities {
  SendMessageResponseModel(
      {required super.mail,
      required super.name,
      required super.phone,
      required super.message});

  factory SendMessageResponseModel.fromJson(Map<String, dynamic> json) {
    return SendMessageResponseModel(
      mail: json["email"],
      name: json["full_name"],
      phone: json["phone"],
      message: json["body"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"mail": mail, "full_name": name, "body": message, "phone": phone};
  }
}

class SendMessageModel extends SendMessageResponseEntities {
  SendMessageModel(
     {required super.mail,
      required super.name,
      required super.phone,
      required super.message,
      required super.createdAt,
      required super.updatedAt,
      required super.id});

  factory SendMessageModel.fromJson(Map<String, dynamic> json) {
    return SendMessageModel(
        id: json["id"].toString(),
        mail: json["email"].toString(),
        name: json["full_name"].toString(),
        phone: json["phone"].toString(),
        message: json["body"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString());
  }
}
