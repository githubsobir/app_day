// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

List<Model> modelFromJson(String str) => List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
  String name;
  List<Root> root;

  Model({
    required this.name,
    required this.root,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    name: json["name"],
    root: List<Root>.from(json["root"].map((x) => Root.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "root": List<dynamic>.from(root.map((x) => x.toJson())),
  };
}

class Root {
  SubCategory subCategory;

  Root({
    required this.subCategory,
  });

  factory Root.fromJson(Map<String, dynamic> json) => Root(
    subCategory: SubCategory.fromJson(json["subCategory"]),
  );

  Map<String, dynamic> toJson() => {
    "subCategory": subCategory.toJson(),
  };
}

class SubCategory {
  String icon;
  String title;
  List<Text123> text;

  SubCategory({
    required this.icon,
    required this.title,
    required this.text,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    icon: json["icon"],
    title: json["title"],
    text: List<Text123>.from(json["text"].map((x) => Text123.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "title": title,
    "text": List<dynamic>.from(text.map((x) => x.toJson())),
  };
}

class Text123 {
  String name1;

  Text123({
    required this.name1,
  });

  factory Text123.fromJson(Map<String, dynamic> json) => Text123(
    name1: json["name1"],
  );

  Map<String, dynamic> toJson() => {
    "name1": name1,
  };
}
