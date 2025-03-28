import 'dart:convert';
import 'dart:developer';

import 'package:app_day/core/urls.dart';
import 'package:app_day/featurs/data/models/send_message_model/send_message_model.dart';
import 'package:dio/dio.dart';

abstract class SendMessageDataSource {
  Future<SendMessageModel> sendData(SendMessageResponseModel sendMessage);
}

class SendMessageDataSourceImpl implements SendMessageDataSource {
  final Dio dio;
  var header = MainUrl();

  SendMessageDataSourceImpl(this.dio);

  @override
  Future<SendMessageModel> sendData(
      SendMessageResponseModel sendMessage) async {
    try {
      final response = await dio.post("${MainUrl.mainUrl}${MainUrl.contacts}",
          options: Options(headers: header.header()),
          data: {
            "email": sendMessage.mail,
            "full_name": sendMessage.name,
            "phone": sendMessage.phone,
            "body": sendMessage.message
          });
      // await Future.delayed(const Duration(seconds: 2));
      log(jsonEncode(response.data));
      return SendMessageModel.fromJson(response.data);
      // return SendMessageModel.fromJson({
      //       "id":"1",
      //       "email":"mail@uz.uz",
      //       "full_name":"fullName",
      //       "phone":"phone",
      //       "body":"body message",
      //       "created_at":"12312123",
      //       "updated_at":"12323123312",
      // });
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
