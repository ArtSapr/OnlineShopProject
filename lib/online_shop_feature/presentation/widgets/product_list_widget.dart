import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_project/online_shop_feature/domain/entities/product_entity.dart';
import 'package:online_shop_project/online_shop_feature/presentation/manager/product_list_cubit/product_list_cubit.dart';
import 'package:online_shop_project/online_shop_feature/presentation/manager/product_list_cubit/product_list_state.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListCubit, ProductState>(
        builder: (context, state) {
      List<ProductEntity> products = [];
      if (state is ProductLoading) {
        return _loadingIndicator();
      } else if (state is ProductLoaded) {
        products = state.productsList;
      }
      return GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemBuilder: (context, index) {
          return Text('${products[index]}', style: TextStyle(color: Colors.black),);
        },
        itemCount: products.length,
      );
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
