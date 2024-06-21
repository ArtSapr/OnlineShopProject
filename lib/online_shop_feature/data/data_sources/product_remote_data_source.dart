import 'dart:convert';

import 'package:online_shop_project/core/error/Exception.dart';
import 'package:online_shop_project/online_shop_feature/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  //Calling this endpoint: https://fakestoreapi.com/products
  Future<List<ProductModel>> getAllProducts();

  //Calling this endpoint: https://fakestoreapi.com/products/category/jewelery
  Future<List<ProductModel>> getSpecifyProducts(String query);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllProducts() =>
      _getPersonFromUrl('https://fakestoreapi.com/products');

  @override
  Future<List<ProductModel>> getSpecifyProducts(String query) =>
      _getPersonFromUrl('https://fakestoreapi.com/products/category/$query');

  Future<List<ProductModel>> _getPersonFromUrl(String url) async {
    print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final products = jsonDecode(response.body);
      return (products as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
