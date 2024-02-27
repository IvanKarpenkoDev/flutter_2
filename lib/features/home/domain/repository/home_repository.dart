
import 'package:apiapp/features/home/domain/entity/cat_entity.dart';
abstract interface class HomeRepository{

  Future<List<CatEntity>> getAllDataCat();

  Future<List<CatEntity>> searchAllDataCat(String name);
}