
import 'package:apiapp/features/home/domain/entity/cat_entity.dart';
import 'package:apiapp/features/home/domain/use_case/home_use_case.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  final HomeUseCase useCase;

  HomeController(this.useCase);

  List<CatEntity> catList = [];

  void init() async {
    catList = await useCase.call();
    notifyListeners();
  }

  void initSearch(String name) async {
    catList = await useCase.callSearch(name);
    notifyListeners();
  }
}