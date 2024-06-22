import 'package:equatable/equatable.dart';

abstract class ProductCategoryEvent extends Equatable {
  const ProductCategoryEvent();

  @override
  List<Object?> get props => [];
}

class CategoryProducts extends ProductCategoryEvent {
  final String categoryQuery;

  const CategoryProducts(this.categoryQuery);
}