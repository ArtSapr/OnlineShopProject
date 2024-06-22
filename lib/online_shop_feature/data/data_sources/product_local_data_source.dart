import 'dart:convert';
import 'package:online_shop_project/core/error/Exception.dart';
import 'package:online_shop_project/online_shop_feature/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getLastProductsFromCache();

  Future<void> productsToCache(List<ProductModel> products);
}

const CACHED_PRODUCTS_LIST = 'CACHED_PRODUCTS_LIST';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ProductModel>> getLastProductsFromCache() {
    final jsonProductsList =
        sharedPreferences.getStringList(CACHED_PRODUCTS_LIST);
    if (jsonProductsList!.isNotEmpty) {
      return Future.value(jsonProductsList
          .map((product) => ProductModel.fromJson(json.decode(product)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<String>> productsToCache(List<ProductModel> products) {
    final List<String> jsonProductsList =
        products.map((product) => json.encode(product.toJson())).toList();

    sharedPreferences.setStringList(CACHED_PRODUCTS_LIST, jsonProductsList);
    print('Products to write Cache:${jsonProductsList.length}');
    return Future.value(jsonProductsList);
  }
}
