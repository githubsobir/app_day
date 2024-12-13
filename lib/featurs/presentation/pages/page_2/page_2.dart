
import 'package:app_day/featurs/presentation/providers/post_provider.dart';
import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:app_day/featurs/presentation/widgets/widget_mini/loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Page2 extends ConsumerStatefulWidget {
  const Page2({super.key});

  @override
  ConsumerState<Page2> createState() => _Page2State();
}



class _Page2State extends ConsumerState<Page2> {

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(filteredItemsProvider);


    return Scaffold(

      appBar: AppBar(
          title:
          Text("search".tr(), style: TextStyle(color: AppColors.white100, fontWeight: FontWeight.w600)),
          backgroundColor: AppColors.appActiveColor,
          iconTheme: IconThemeData(color: AppColors.white100),
          elevation: 0),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: TextField(

                onTapOutside: (val) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  hintText: "search".tr(),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 0.3)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 0.3)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 0.3)
                  ),
                ),
                onChanged: (value) {
                  ref.read(searchQueryProvider.notifier).state = value;
                },
                onEditingComplete: () {

                },
              ),
            ),
            Expanded(

              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    title: Text(item.name),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getData(dynamic data) {
    try {

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            "noInformation".tr(),
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    } catch (ee) {
      return Center(child: appLoading());
    }
  }
}