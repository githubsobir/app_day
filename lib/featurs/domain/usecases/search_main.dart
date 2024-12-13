import 'package:app_day/featurs/domain/entities/main_service.dart';

class SearchItems {
  List<Datum> call(String query, List<Datum> items) {
    if (query.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
