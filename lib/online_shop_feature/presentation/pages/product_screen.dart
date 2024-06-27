import 'package:flutter/material.dart';

import '../widgets/category_dialog.dart';
import '../widgets/product_list_widget.dart';

class ProductScreenPage extends StatefulWidget {
  const ProductScreenPage({super.key});

  @override
  State<ProductScreenPage> createState() => _ProductScreenPageState();
}

class _ProductScreenPageState extends State<ProductScreenPage> {

  String _selectedCategory = 'All'; // Текущая категория

  void _updateCategory(String newCategory) {
    setState(() {
      _selectedCategory = newCategory;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: const Text(
          'Products',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.layers,
            color: Colors.black,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CategoryDialog(
                  initialCategory: _selectedCategory,
                  onCategorySelected: _updateCategory,
                );
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ProductList(_selectedCategory),
    );
  }
}
