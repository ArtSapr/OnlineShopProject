import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_project/online_shop_feature/domain/entities/product_entity.dart';
import 'package:online_shop_project/online_shop_feature/domain/use_cases/get_all_products.dart';
import 'package:online_shop_project/online_shop_feature/presentation/manager/product_list_cubit/product_list_state.dart';

import '../../../../core/error/failure.dart';

const SERVER_FAILURE_MESSAGE = 'Server failure';
const CACHED_FAILURE_MESSAGE = 'Cache failure';

class ProductListCubit extends Cubit<ProductState> {
  final GetAllProducts getAllProducts;

  ProductListCubit({required this.getAllProducts}) : super(ProductEmpty());

  void loadProduct() async {

    emit(ProductLoading());

    final failureOrProduct = await getAllProducts();

    failureOrProduct.fold(
            (error) => ProductError(message: _mapFailureToMessage(error)),
            (product) => emit(ProductLoaded(product)));
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