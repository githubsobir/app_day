import 'package:app_day/featurs/domain/entities/send_mail.dart';
import 'package:app_day/featurs/presentation/providers/provider_send_message.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultPage extends ConsumerWidget {
  final SendMessageEntities sendMessageEntities;

  const ResultPage({super.key, required this.sendMessageEntities});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(setMessage(sendMessageEntities));
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: AppColors.white100),),
      body: SafeArea(
          child: Center(
        child: Container(
            margin: EdgeInsets.all(20),
            child: data.when(data: (data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Xabar yuborildi.\nKiritilgan elektron pochtaga yaqin vaqtda javob xabari yuboriladi",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    minWidth: double.infinity,
                    color: AppColors.appActiveColor,
                    child: Text(
                      "ok".tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              );
            }, error: (error, er) {
              return Text(error.toString());
            }, loading: () {
              return Center(child: appLoading());
            })),
      )),
    );
  }
}
