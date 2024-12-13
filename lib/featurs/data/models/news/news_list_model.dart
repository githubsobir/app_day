import 'package:app_day/featurs/domain/entities/news_list.dart';

class NewsListModel extends NewsList {
  NewsListModel({super.id, super.url, super.title, super.updatedAt});

  factory NewsListModel.fromJson(Map<String, dynamic> json) => NewsListModel(
        id: json["id"],
        url: json["url"],
        title: json["title"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "title": title,
        "updated_at": updatedAt,
      };
}
