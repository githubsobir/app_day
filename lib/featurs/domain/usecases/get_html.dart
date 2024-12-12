import 'package:app_day/featurs/domain/entities/html_model.dart';
import 'package:app_day/featurs/domain/repositories/html_repository.dart';

class GetHtmlUseCase {
  final HtmlRepository repository;

  GetHtmlUseCase(this.repository);

  Future<Htmls> call() async {
    return await repository.getHtml();
  }
}