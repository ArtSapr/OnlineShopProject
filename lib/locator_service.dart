import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:online_shop_project/core/platform/network_info.dart';
import 'package:online_shop_project/online_shop_feature/data/data_sources/product_local_data_source.dart';
import 'package:online_shop_project/online_shop_feature/data/data_sources/product_remote_data_source.dart';
import 'package:online_shop_project/online_shop_feature/domain/repositories/product_repository.dart';
import 'package:online_shop_project/online_shop_feature/domain/use_cases/get_all_products.dart';
import 'package:online_shop_project/online_shop_feature/presentation/manager/product_list_cubit/product_list_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'online_shop_feature/data/repositories/product_repository_impl.dart';
import 'online_shop_feature/domain/use_cases/get_specify_products.dart';
import 'online_shop_feature/presentation/manager/bloc/category_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc / Cubit
  sl.registerFactory(
    () => ProductListCubit(getAllProducts: sl()),
  );
  sl.registerFactory(
    () => ProductCategoryBloc(categoryProduct: sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetSpecifyProducts(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: http.Client()));

  sl.registerLazySingleton<ProductLocalDataSource>(
          () => ProductLocalDataSourceImpl(sharedPreferences: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkINfoImpl(sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
