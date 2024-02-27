import 'package:apiapp/features/home/data/data_source/home_local_data_source.dart';
import 'package:apiapp/features/home/data/mappers/cat_mapper.dart';
import 'package:apiapp/features/home/domain/entity/cat_entity.dart';
import 'package:apiapp/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{
final  HomeLocalDataSource dataSource;
  HomeRepositoryImpl({required this.dataSource});
  @override
  Future<List<CatEntity>> getAllDataCat() async{
    final data = await dataSource.getAllDataCat();
    return data.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<CatEntity>> searchAllDataCat(String name) async{
    final data = await dataSource.searchAllDataCat(name);
    return data.map((e) => e.toEntity()).toList();
  }
}