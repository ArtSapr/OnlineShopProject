import 'package:flutter/material.dart';
import 'package:online_shop_project/online_shop_feature/domain/entities/product_entity.dart';

class CartListProvider with ChangeNotifier {
  final List<ProductEntity> _items = [];

  List<ProductEntity> get items => _items;

  void addProduct(ProductEntity item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItemAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}