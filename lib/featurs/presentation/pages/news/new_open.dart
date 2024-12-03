import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/size.dart';
import 'package:flutter/material.dart';

class NewsOpen extends StatefulWidget {
  const NewsOpen({super.key});

  @override
  State<NewsOpen> createState() => _NewsOpenState();
}

class _NewsOpenState extends State<NewsOpen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yangiliklar",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.appActiveColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              "Joriy yilning o‘tgan davri mobaynida amalga oshirilgan ishlar sarhisob qilindi",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Image.network(
                "http://new.standart.uz/upload/image/inshot_20241129_152957682_(1).jpg",
                width: AppSize.w(context: context) * 0.8),
            SizedBox(height: 15),
            Container(
                margin: EdgeInsets.all(15),
                child: Text("O‘zbekiston texnik jihatdan tartibga solish agentligi direktori Akmal Jumanazarov raisligida agentlik va uning tizim tashkilotlari tomonidan joriy yilning yanvar–noyabr oylari davomida amalga oshirilgan ishlar, yo‘l qo‘yilgan kamchiliklar, ularni bartaraf etish borasida ko‘rilayotgan choralar hamda yil yakuniga qadar bajarilishi lozim bo‘lgan dolzarb vazifalar yuzasidan yig‘ilish bo‘lib o‘tdi. Yig‘ilishda Oliy Majlis Qonunchilik palatasining Bosh vazir lavozimiga nomzodni ko‘rib chiqish va Vazirlar mahkamasining yaqin va uzoq istiqbolga mo‘ljallangan harakatlar dasturi muhokamasiga bag‘ishlangan majlisida Abdulla Aripov tomonidan standartlashtirish sohasida ilgari surilgan kelgusi rejalar ijrosi muhokama qilindi.", textAlign: TextAlign.justify,))
          ],
        ),
      )),
    );
  }
}
