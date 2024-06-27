import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_project/online_shop_feature/domain/entities/product_entity.dart';
import 'package:online_shop_project/online_shop_feature/presentation/manager/product_list_cubit/product_list_cubit.dart';
import 'package:online_shop_project/online_shop_feature/presentation/manager/product_list_cubit/product_list_state.dart';

class ProductList extends StatelessWidget {
  final String category;

  const ProductList(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListCubit, ProductState>(
        builder: (context, state) {
      List<ProductEntity> products = [];
      if (state is ProductLoading) {
        return _loadingIndicator();
      } else if (state is ProductLoaded) {
        for (var product in state.productsList) {
          if(product.category.toLowerCase() == category.toLowerCase() || category == 'All') {
            products.add(product);
          }
        }
      }
      return GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Действие при нажатии на товар (если нужно)
            },
            child: Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.network(
                                products[index].image,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  products[index].title,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${products[index].price}\$',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
        itemCount: products.length,
      );
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Online shop',
              style: TextStyle(color: Colors.black, fontSize: 50),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
