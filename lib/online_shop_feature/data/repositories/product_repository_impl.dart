import 'package:dartz/dartz.dart';
import 'package:online_shop_project/core/error/Exception.dart';

import 'package:online_shop_project/core/error/failure.dart';
import 'package:online_shop_project/core/platform/ntework_info.dart';
import 'package:online_shop_project/online_shop_feature/data/data_sources/product_local_data_source.dart';
import 'package:online_shop_project/online_shop_feature/data/data_sources/product_remote_data_source.dart';

import 'package:online_shop_project/online_shop_feature/domain/entities/product_entity.dart';

import '../../domain/repositories/product_repository.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    return await _getProducts(() {
      return remoteDataSource.getAllProducts();
    });
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSpecifyProducts(
      String query) async {
    return await _getProducts(() {
      return remoteDataSource.getSpecifyProducts(query);
    });
  }

  Future<Either<Failure, List<ProductModel>>> _getProducts(
      Future<List<ProductModel>> Function() getProducts) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProduct = await getProducts();
        localDataSource.productsToCache(remoteProduct);
        return Right(remoteProduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationProduct =
        await localDataSource.getLastProductsFromCache();
        return Right(locationProduct);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
