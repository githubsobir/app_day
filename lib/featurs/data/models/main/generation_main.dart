import 'package:app_day/featurs/data/models/main/main_model.dart';

class GenerationListMain {
   ModelCetegories modelServiceListMain = ModelCetegories(
      success: true,
      body: Body(category: [
        Category(categoryName: "Category 1", id: 1, status: 1, service: [
          Home(
              id: 1,
              categoryId: 1,
              title: "Birinchi",
              icon: "icon",
              viewLink: "viewLink",
              status: 1,
              home: 2),
          Home(
              id: 2,
              categoryId: 2,
              title: "Ikkinchi",
              icon: "icon",
              viewLink: "viewLink",
              status: 1,
              home: 2),
          Home(
              id: 3,
              categoryId: 3,
              title: "Uchunchi",
              icon: "icon",
              viewLink: "viewLink",
              status: 1,
              home: 2),
        ])
      ], home: [
        Home(
            id: 4,
            categoryId: 4,
            title: "To'rtinchi",
            icon: "icon",
            viewLink: "viewLink",
            status: 1,
            home: 2),
      ]));
}
