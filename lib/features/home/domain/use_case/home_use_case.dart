
import 'package:apiapp/features/home/domain/entity/cat_entity.dart';
import 'package:apiapp/features/home/domain/repository/home_repository.dart';

class HomeUseCase {
  final HomeRepository _repository;

  HomeUseCase(this._repository);

  Future<List<CatEntity>> call() async {
    return _repository.getAllDataCat();
  }

  Future<List<CatEntity>> callSearch(String name) async {
    return _repository.searchAllDataCat(name);
  }
}