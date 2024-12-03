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
  GenerationListMain generationListMain = GenerationListMain();


  List<String> list  = ["Texnik jihatdan tartibga solish",
  "Standartlashtirish",
    "Metrologiya",
    "Sertifikatlashtirish",
    "Akkreditatsiya",
    "Eksport buyrosi",
    "Sifat",
    "Davlat nazorati",
    "Shtrix kodlar",
    "Ilmiy ishlar",
    "Kadrlarni qayta tayyorlash"

  ];

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
          leading: IconButton(icon: Icon(Icons.list_alt_outlined, color: Colors.white,),
          onPressed: (){},
          ),
          actions: [
             IconButton(icon: Icon(Icons.account_box_sharp, color: Colors.white,),
              onPressed: (){
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
            itemCount: list.length,
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
                                  child: Text(
                                    list[index],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    // ref
                                    //     .read(showBottomBar.notifier)
                                    //     .update((state) => true);
                                    // await Future.delayed(Duration(milliseconds: 200));
                                    showGridView(index);
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
                            itemCount: 8,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: ServicePage(
                                      serviceId: index.toString(),
                                      serviceName: "Xizmat nomi ${index + 1}"),
                                  withNavBar: false,
                                  // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                height: 120,
                                width: 120,
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
                                    Text("Xizmat nomi ${index + 1}")
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

  showGridView(int index) {
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
                "$index Category Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemBuilder: (context, index) => Container(
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
                      Text("Xizmat nomi ${index + 1}")
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
