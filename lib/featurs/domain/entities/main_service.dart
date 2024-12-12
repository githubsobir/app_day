class Post {
  final bool success;
  final List<Datum> data;

  Post({required this.success, required this.data});
}

class Datum {
  final dynamic id;
  final dynamic name;
  final dynamic icon;
  final List<Datum> children;

  Datum({required this.id, required this.name, this.icon, required this.children});
}