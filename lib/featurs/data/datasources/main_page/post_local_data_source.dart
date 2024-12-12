import 'dart:convert';

import 'package:app_day/featurs/data/models/main/post_model.dart';
import 'package:hive/hive.dart';

class PostLocalDataSource {
  final Box box;

  PostLocalDataSource(this.box);

  Future<void> cachePosts(PostModel posts) async {
    await box.put('posts',jsonEncode(posts).toString());
  }

  PostModel getCachedPosts() {
    final cachedData = box.get('posts');
    return PostModel.fromJson(jsonDecode(cachedData));
  }
}