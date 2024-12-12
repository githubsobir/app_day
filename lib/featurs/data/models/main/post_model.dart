import 'package:app_day/featurs/domain/entities/main_service.dart';

class PostModel extends Post {
  PostModel({required bool success, required List<DatumModel> data})
      : super(success: success, data: data);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      success: json['success'],
      data: (json['data'] as List).map((item) => DatumModel.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((item) => (item as DatumModel).toJson()).toList(),
    };
  }
}

class DatumModel extends Datum {
  DatumModel({required int id, required String name, String? icon, required List<DatumModel> children})
      : super(id: id, name: name, icon: icon, children: children);

  factory DatumModel.fromJson(Map<String, dynamic> json) {
    return DatumModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      children: (json['children'] as List).map((item) => DatumModel.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'children': children.map((item) => (item as DatumModel).toJson()).toList(),
    };
  }
}