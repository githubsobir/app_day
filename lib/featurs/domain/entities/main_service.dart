class Post {
  final dynamic success;
  final List<Datum> data;

  Post({this.success, required this.data});
}

class Datum {
  final dynamic id;
  final dynamic name;
  final dynamic icon;
  final List<Datum> children;

  Datum({this.id, this.name, this.icon, required this.children});
}
