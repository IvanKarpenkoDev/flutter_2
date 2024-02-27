import 'package:apiapp/dj/service.dart';
import 'package:apiapp/features/home/data/model/cat_model.dart';
import 'package:dio/dio.dart';

abstract interface class HomeLocalDataSource {
  Future<List<CatModel>> getAllDataCat();
  Future<List<CatModel>> searchAllDataCat(String name);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  late List<CatModel> catList;

  @override
  Future<List<CatModel>> getAllDataCat() async {
    final data = await service<Dio>().get('cats?name=a');
      return (data.data as List).map((json) => CatModel.fromJson(json)).toList();
  }

  @override
  Future<List<CatModel>> searchAllDataCat(String name) async {
    try{
      final data = await service<Dio>().get('cats?name=$name');
      return (data.data as List).map((json) => CatModel.fromJson(json)).toList();
    }
    on DioException catch (e) {
      print(e.message);
      return [];
    }
  }
}
