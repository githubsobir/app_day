import 'package:app_day/core/hive_saved/hive_saved.dart';

class MainUrl {
  /// app saved
  var box = AppSaved();

  /// main url
  static String mainUrl = "http://forms.standart.uz:8091";

  /// main page url
  static String mainPageUrl = "/tree/index";

  /// banner carusel
  static String bannerNewsList = "/banner/news";

  /// html view by id
  static String htmlViewById = "/content/index?tree_id=";

  /// banner
  static String bannerWithId = "/banner/view?id=";

  /// news list
  static String newsList = "/banner/index";

  static Map<String, Map<String, String>> urlSocialMedia =
  {
    "facebook":{"facebook.com":"/uzstandard"},
    "youtube":{"youtube.com":"/@uzstandard"},
    "telegram":{"t.me":"/UzstandardChannel"},
    "instagram":{ "instagram.com":"/uzstandard"},
    "x":{"x.com":"/Uzstandard"},

  };

  Map<String, dynamic> header() {
    return {
      "Accept-Language": box.lang,
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJmb3Jtcy5zdGFuZGFydC51eiIsImF1ZCI6ImZvcm1zLnN0YW5kYXJ0LnV6IiwiaWF0IjoxNzMzMjI3NzQ0LCJuYmYiOjE3MzMyMjc3NDQsImV4cCI6MTczMzIzMTM0NCwiZGF0YSI6eyJ1c2VySWQiOjR9fQ.9QUAF_TCWfEAdEuy05TiyJNWfMetf5QDRWrhGbwn42M"
    };
  }
}
