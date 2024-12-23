import 'package:app_day/featurs/domain/entities/news.dart';

class NewsModel extends News {
  NewsModel({super.id, super.url, super.title, super.updatedAt});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        url: json["url"],
        title: json["title"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "title": title,
        "updated_at": updatedAt.toIso8601String(),
      };
}
