import 'dart:convert';

import 'package:app_day/featurs/data/models/main/post_model.dart';
import 'package:app_day/featurs/domain/entities/main_service.dart';
import 'package:hive/hive.dart';

class PostLocalDataSource {
  final Box box;

  PostLocalDataSource(this.box);

  Future<void> cachePosts(PostModel posts) async {
    await box.put('posts', jsonEncode(posts).toString());
  }

  PostModel getCachedPosts() {
    final cachedData = box.get('posts');
    return PostModel.fromJson(jsonDecode(cachedData));
  }

  List<Datum> getCachedPostAllOneList() {
    final cachedData = box.get('posts');
    List<Datum> list = [];
    try {
      for (var element in PostModel.fromJson(jsonDecode(cachedData)).data) {
        for (var element2 in element.children) {
          list.add(element2);
        }
      }

      return list;
    } catch (e) {
      // list datum defaoult qiymat qo'shib qaytarishim kerak shu yerda '
      list.add(Datum(icon: "null", name: "null", id: "null", children: []));
      return [];
    }
  }
}
