import 'package:dartz/dartz.dart';
import 'package:online_shop_project/core/error/failure.dart';
import 'package:online_shop_project/online_shop_feature/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, List<ProductEntity>>> getSpecifyProducts(String query);
}