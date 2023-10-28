import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:products/core/utils/api_service.dart';
import '../../features/home/data/repos/home_repo_imp.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(getIt.get<ApiService>()));


}