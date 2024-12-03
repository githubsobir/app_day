class ModelCetegories {
  bool success;
  Body body;

  ModelCetegories({
    required this.success,
    required this.body,
  });

  factory ModelCetegories.fromJson(Map<String, dynamic> json) => ModelCetegories(
    success: json["success"],
    body: Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "body": body.toJson(),
  };
}

class Body {
  List<Category> category;
  List<Home> home;

  Body({
    required this.category,
    required this.home,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    home: List<Home>.from(json["home"].map((x) => Home.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "home": List<dynamic>.from(home.map((x) => x.toJson())),
  };
}

class Category {
  String categoryName;
  int id;
  int status;
  List<Home> service;

  Category({
    required this.categoryName,
    required this.id,
    required this.status,
    required this.service,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryName: json["category_name"],
    id: json["id"],
    status: json["status"],
    service: List<Home>.from(json["service"].map((x) => Home.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "id": id,
    "status": status,
    "service": List<dynamic>.from(service.map((x) => x.toJson())),
  };
}

class Home {
  int id;
  int categoryId;
  String title;
  String icon;
  String viewLink;
  int status;
  int home;

  Home({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.icon,
    required this.viewLink,
    required this.status,
    required this.home,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    id: json["id"],
    categoryId: json["category_id"],
    title: json["title"],
    icon: json["icon"],
    viewLink: json["view_link"],
    status: json["status"],
    home: json["home"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "title": title,
    "icon": icon,
    "view_link": viewLink,
    "status": status,
    "home": home,
  };
}
