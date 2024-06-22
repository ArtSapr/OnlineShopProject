import 'package:equatable/equatable.dart';
import '../../../domain/entities/product_entity.dart';

abstract class ProductCategoryState extends Equatable {
  const ProductCategoryState();
  @override
  List<Object?> get props => [];
}

class ProductAllCategories extends ProductCategoryState {}

class ProductCategoryLoading extends ProductCategoryState {}

class ProductCategoryLoaded extends ProductCategoryState {
  final List<ProductEntity> products;

  const ProductCategoryLoaded({required this.products});

  @override
  List<Object?> get props => [products];
}

class ProductCategoryError extends ProductCategoryState {
  final String message;

  const ProductCategoryError({required this.message});

  @override
  List<Object?> get props => [message];
}