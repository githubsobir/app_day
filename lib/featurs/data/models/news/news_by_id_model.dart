import 'package:app_day/featurs/domain/entities/news_by_id.dart';

class NewByIdModel extends NewById {
  NewByIdModel(
      {required super.content,
      required super.url,
      required super.title,
      required super.updatedAt});

  factory NewByIdModel.fromJson(Map<String, dynamic> json) => NewByIdModel(
    content: json["content"],
        url: json["url"],
        title: json["title"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "url": url,
        "title": title,
        "updated_at": updatedAt.toIso8601String(),
      };
}
