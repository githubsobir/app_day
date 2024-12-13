import 'package:app_day/featurs/presentation/pages/news/new_open.dart';
import 'package:app_day/featurs/presentation/providers/news_list.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/loading.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_2/persistent_tab_view.dart';

class NewsList extends ConsumerStatefulWidget {
  const NewsList({super.key});

  @override
  ConsumerState<NewsList> createState() => _NewsListState();
}

class _NewsListState extends ConsumerState<NewsList> {
  @override
  Widget build(BuildContext context) {
    var refData = ref.watch(newsListProvider);

    return Scaffold(
      backgroundColor: AppColors.white100,
      appBar: AppBar(
        backgroundColor: AppColors.appActiveColor,
        centerTitle: true,
        title: Text(
          "news".tr(),
          style:
              TextStyle(fontWeight: FontWeight.bold, color: AppColors.white100),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(10),
        child: refData.when(data: (data) {
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: NewsOpen(
                      newId: data[index].id.toString(),
                      title: data[index].title.toString()
                    ),
                    withNavBar: false,
                    // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Card(
                  color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                      height: 220,
                                      width: AppSize.w(context: context),
                                      imageUrl: data[index].url,
                                      alignment: Alignment.topCenter,
                                      fit: BoxFit.cover),
                                ),
                                SizedBox(
                                  height: 220,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      padding: EdgeInsets.fromLTRB(3,1,3,1),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.7),
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Text(
                                          DateFormat('kk:mm dd-MM-yyyy').format(
                                              DateTime.parse(data[index]
                                                  .updatedAt
                                                  .toString())),
                                          style: TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(data[index].title.toString())
                          ],
                        ),
                      ),
                    ),
              ));
        }, error: (error, errorText) {
          return Center(child: Text(errorText.toString()));
        }, loading: () {
          return appLoading();
        }),
      )),
    );
  }
}