import 'package:dartz/dartz.dart';
import 'package:online_shop_project/online_shop_feature/domain/repositories/product_repository.dart';
import '../../../core/error/failure.dart';
import '../entities/product_entity.dart';

class GetAllProducts {
  final ProductRepository productRepository;

  GetAllProducts(this.productRepository);

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await productRepository.getAllProducts();
  }
}