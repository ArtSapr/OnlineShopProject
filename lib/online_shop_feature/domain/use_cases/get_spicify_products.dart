import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:online_shop_project/core/usecases/usecase.dart';
import 'package:online_shop_project/online_shop_feature/domain/repositories/product_repository.dart';
import '../../../core/error/failure.dart';
import '../entities/product_entity.dart';

class GetSpecifyProducts extends UseCase<List<ProductEntity>, SpecifyProductsParams>{
  final ProductRepository productRepository;

  GetSpecifyProducts(this.productRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(SpecifyProductsParams params) async {
    return await productRepository.getSpecifyProducts(params.query);
  }
}

class SpecifyProductsParams extends Equatable {
  final String query;

  const SpecifyProductsParams(this.query);

  @override
  List<Object?> get props => [query];
}