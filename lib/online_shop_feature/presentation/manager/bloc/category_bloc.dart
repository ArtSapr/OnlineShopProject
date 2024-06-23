import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_project/core/error/failure.dart';
import 'package:online_shop_project/online_shop_feature/domain/use_cases/get_specify_products.dart';
import 'category_event.dart';
import 'category_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server failure';
const CACHED_FAILURE_MESSAGE = 'Cache failure';

class ProductCategoryBloc extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final GetSpecifyProducts categoryProduct;

  ProductCategoryBloc({required this.categoryProduct}) : super(ProductEmpty()) {
    on<CategoryProducts>(_onEvent);
  }

  FutureOr<void> _onEvent(CategoryProducts event, Emitter<ProductCategoryState> emit) async {
    emit(ProductCategoryLoading());
    final failureOrProduct = await categoryProduct(SpecifyProductsParams(query: event.categoryQuery));
    emit(failureOrProduct.fold(
        (failure) => ProductCategoryError(message: _mapFailureToMessage(failure)),
        (product) => ProductCategoryLoaded(products: product)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}