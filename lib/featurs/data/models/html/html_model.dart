import 'package:app_day/featurs/domain/entities/html_model.dart';

class HtmlModel extends Htmls{
  HtmlModel({ super.content,  super.updatedAt});

  factory HtmlModel.fromJson(Map<String, dynamic> json) => HtmlModel(
    content: json["content"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "updated_at": updatedAt.toIso8601String(),
  };

}