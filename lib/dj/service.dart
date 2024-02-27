import 'package:apiapp/core/interceptor_app.dart';
import 'package:apiapp/features/home/data/data_source/home_local_data_source.dart';
import 'package:apiapp/features/home/data/repository/home_repository_impl.dart';
import 'package:apiapp/features/home/domain/repository/home_repository.dart';
import 'package:apiapp/features/home/domain/use_case/home_use_case.dart';
import 'package:apiapp/features/home/presentation/controller/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final service = GetIt.instance;

Future<void> initDJ() async {


  service.registerFactory(() => HomeController(service()));



  service.registerLazySingleton(() => HomeUseCase(service()));


  service.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl());
  service.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(dataSource: service()));
      

  service.registerLazySingleton(() => Dio(
        BaseOptions(
          headers: {"X-Api-Key": "ozrocuHGseUnGXrvmd9koSKjWHKmcxlbC1BNeHXQ"},
          baseUrl: 'https://api.api-ninjas.com/v1/',
        ),
      )..interceptors.addAll(
          [
            InterceptorsApp(),
            PrettyDioLogger(),
          ],
        ));
}