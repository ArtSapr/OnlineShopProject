import 'package:flutter/material.dart';

import '../widgets/product_type_dialog.dart';
import '../widgets/product_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                return ProductTypeDialog();
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
            onPressed: () {
              ProductTypeDialog();
            },
          ),
        ],
      ),
      body: const ProductList(),
    );
  }
}
