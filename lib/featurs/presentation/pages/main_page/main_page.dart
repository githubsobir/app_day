import 'package:app_day/featurs/data/models/main/generation_main.dart';
import 'package:app_day/featurs/presentation/pages/login_page/login_page.dart';
import 'package:app_day/featurs/presentation/pages/news/news.dart';
import 'package:app_day/featurs/presentation/pages/service_page/service_page.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final List<Model> _list = [
    Model(name: "Eksportyorga yordam", root: [
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Yevropa Ittifoqi qanday bozor",
              text: [
                Text123(name1: "Yevropa Ittifoqining yagona bozori"),
                Text123(name1: "Yevropa Ittifoqiga eksport qilishda «GSP+»tizimi imkoniyatlaridan foydalanish"),
                Text123(name1: "Yevropa Ittifoqi mamlakatlariga meva-sabzavot mahsulotlarinieksport qilish jarayoni (O‘zbekiston Respublikasi talablari)"),
                Text123(name1: "«REX» tizimida ro'yxatdan o'tish bosqichlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Yevropa Ittifoqi mamlakatlariga meva-sabzavot mahsulotlarini eksport qilish jarayoni",
              text: [
                Text123(name1: "Yevropa Ittifoqi bojxona organlari"),
                Text123(name1: "Ichki soliqqa tortish"),
                Text123(name1: "Import boji stavkalari"),
                Text123(name1: "Texnik talablar"),
                Text123(name1: "Texnik talablar"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Eksport bozorlarini zabt etish",
              text: [
                Text123(name1: "Oziq-ovqat mahsulotlari uchun gigiyena qoidalari"),
                Text123(name1: "Standart va sertifikatlar"),
                Text123(name1: "Meva-sabzavot mahsulotlarini Yevropa Ittifoqi mamlakatlariga eksport qilish uchun maxsus talablar"),
                Text123(name1: "Meva-sabzavot mahsulotlarining sanitariya nazorati"),
                Text123(name1: "Oziq-ovqat tarkibidagi zararli moddalarni nazorat qilish"),
                Text123(name1: "Inson iste'moli uchun mo'ljallangan o'simlik va hayvon mahsulotlarida pestitsidlar qoldiqlarini sanitariya nazorati"),
                Text123(name1: "Fitosanitariya nazorati"),
                Text123(name1: "Meva va sabzavot mahsulotlarining bozor standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Meva-sabzavot mahsulotlarini Yevropa Ittifoqiga eksport qilishga qo‘yildigan talablar(Germaniya misolida)",
              text: [
                Text123(name1: "Yangi uzilgan mevalar"),
                Text123(name1: "Quritilgan mevalar"),
                Text123(name1: "Yangi sabzavotlar"),
                Text123(name1: "Quritilgan sabzavotlar"),
                Text123(name1: "Sharbat va konsentratlar"),
              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Yevropa Ittifoqi uchun oziq-ovqat mahsulotlarini sertifikatlash",
              text: [
                Text123(name1: "Yangi uzilgan mevalar"),
                Text123(name1: "Quritilgan mevalar"),
                Text123(name1: "Yangi sabzavotlar"),
                Text123(name1: "Quritilgan sabzavotlar"),
                Text123(name1: "Sharbat va konsentratlar"),
              ]))
    ]),


    Model(name: "Standartlashtirish", root: [
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Texnik qo'mitalar",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Texnik qo'mitalar",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "TBT portali",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Xizmatlar",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),


    ]),
    Model(name: "Maxsulotlarni sertifikatlashtirish", root: [
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Xavf darajasi yuqori boʻlgan mahsulotlarni majburiy davlat roʻyxatidan oʻtkazish",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Маҳсулотларни сертификатлаштириш тартиби",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Хавф даражаси юқори бўлмаган маҳсулотларнинг мувофиқлигини декларациялаш йўли билан тасдиқлаш",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "O'zbekiston ilmiy sinov va sifat nazorati markazi",
              text: [
                Text123(name1: "Markaz haqida ma'lumot"),
                Text123(name1: "Markaznining muvofiqlikni baxolash organlari"),
                Text123(name1: "Markaznining hududiy filiallari"),
              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Xizmatlar",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),


    ]),

    Model(name: "Менежмент тизимларини жорий этиш ва сертификатлаштириш тартиби", root: [
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Normativ huquqiy hujjatlar",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "менежмент тизимларини сертификатлаштириш органи",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "менежмент тизимларини сертификатлаштириш органlariga ariza yuborish",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "менежмент тизимлариga joriy qilinadigan standartlar",
              text: [
                Text123(name1: "Markaz haqida ma'lumot"),
                Text123(name1: "Markaznining muvofiqlikni baxolash organlari"),
                Text123(name1: "Markaznining hududiy filiallari"),
              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Menejment tizimlarini joriy qilishda xalqaro standartlar",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "GSP+ va REX tizimlari to‘g‘risida",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),


    ]),

    Model(name: "Akkreditatsiya yo'nalishi", root: [
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Akkreditatsiya",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Muvofiqlikni baholash",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "muvofiqlikni baholash organlari",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Akkreditatsiya belgisi",
              text: [
                Text123(name1: "Markaz haqida ma'lumot"),
                Text123(name1: "Markaznining muvofiqlikni baxolash organlari"),
                Text123(name1: "Markaznining hududiy filiallari"),
              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "ILAC / IAF - ILAC / IAF",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "O‘zbekiston milliy akkreditatsiya tizimi",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Akkreditatsiya to‘g‘risidagi qonun",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),


    ]),
    Model(name: "Metrologiya yo'nalishi", root: [
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Metrologiya xizmati bo'yicha hududiy filiallar",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Хизмат турлари",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Фойдали видеороликлар",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Ягона дарча орқали маиший ҳисоблагичларни текшириш",
              text: [
                Text123(name1: "Markaz haqida ma'lumot"),
                Text123(name1: "Markaznining muvofiqlikni baxolash organlari"),
                Text123(name1: "Markaznining hududiy filiallari"),
              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Мобиль лабораториялар",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Эталонлар рўйхати ва маълумоти",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Reestrlar",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),


    ]),
    Model(name: "Davlat nazorati", root: [
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "1. Inspeksiya",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "2. Davlat nazorati",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "3. Xavf tahlili",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "4. Nazorat haridi",
              text: [
                Text123(name1: "Markaz haqida ma'lumot"),
                Text123(name1: "Markaznining muvofiqlikni baxolash organlari"),
                Text123(name1: "Markaznining hududiy filiallari"),
              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "5. Nazoratdagi mahsulotlar tahlili",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "6. Profilaktika",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "7. Davlat inspektori",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),


    ]),
    Model(name: "Саноат корхоналарига экспортда кўмаклашиш", root: [
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Sohalar",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Экспорт қилинадиган маҳсулотлар",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Маҳсулот экспорт қилинадиган давлатлар",
              text: [
                Text123(name1: "Mavjud standartlar ro'yxati  https://uzsti.uz/shop"),
                Text123(name1: "Texnik qo'mitalar"),
                Text123(name1: "TBT portali"),
                Text123(name1: "Xizmatlar"),
                Text123(name1: "Xorijiy Davlat standartlari"),



              ])),
      Root(
          subCategory: SubCategory(
              icon: "icon",
              title: "Давлатлар томонидан қўйилган талаблар",
              text: [
                Text123(name1: "Markaz haqida ma'lumot"),
                Text123(name1: "Markaznining muvofiqlikni baxolash organlari"),
                Text123(name1: "Markaznining hududiy filiallari"),
              ])),




    ]),

  ];

  // List<String> list  = ["Texnik jihatdan tartibga solish",
  // "Standartlashtirish",
  //   "Metrologiya",
  //   "Sertifikatlashtirish",
  //   "Akkreditatsiya",
  //   "Eksport buyrosi",
  //   "Sifat",
  //   "Davlat nazorati",
  //   "Shtrix kodlar",
  //   "Ilmiy ishlar",
  //   "Kadrlarni qayta tayyorlash"
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Standart ko'makchi",
            style: TextStyle(
                color: AppColors.white100, fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: AppColors.white100),
          leading: IconButton(
            icon: Icon(
              Icons.list_alt_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.account_box_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreen(context,
                    screen: const LoginPage(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino);
              },
            ),
          ],
          backgroundColor: AppColors.appActiveColor,
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) => index == 0
                ? carouselMain(context: context)
                : Container(
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    height: 200,
                    child: Column(
                      children: [
                        SizedBox(
                            height: 50,
                            width: AppSize.w(context: context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: SizedBox(
                                    width: AppSize.w(context:context )*0.7,
                                    child: Text(
                                      _list[index].name,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    // ref
                                    //     .read(showBottomBar.notifier)
                                    //     .update((state) => true);
                                    // await Future.delayed(Duration(milliseconds: 200));
                                    showGridView(index, _list[index].root,_list[index].name );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      "Yana",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade900),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 130,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _list[index].root.length,
                            itemBuilder: (context, id2) => GestureDetector(
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: ServicePage(root: _list[index].root[id2]),
                                  withNavBar: false,
                                  // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 0.5, color: Colors.grey)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.account_balance,
                                      size: 80,
                                      color: Colors.blue.shade900,
                                    ),
                                    Text(_list[index].root[id2].subCategory.title,
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                    maxLines: 1,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ));
  }

  showGridView(int index, List<Root> root, String name) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      backgroundColor: Colors.white,

      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: root.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemBuilder: (context, ix) => Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.account_balance,
                        size: 80,
                        color: Colors.blue.shade900,
                      ),
                      Text(root[ix].subCategory.title, maxLines: 1, style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      // )
      // .then(
      // (value) => ref.read(showBottomBar.notifier).update((state) => false)
    );
  }
}
