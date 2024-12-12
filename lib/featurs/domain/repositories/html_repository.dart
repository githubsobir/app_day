
import 'package:app_day/featurs/data/models/html/html_model.dart';

abstract class HtmlRepository {
  Future<HtmlModel> getHtml();
}