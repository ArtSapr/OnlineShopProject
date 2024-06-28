import 'package:flutter/material.dart';
import 'package:online_shop_project/online_shop_feature/presentation/pages/product_screen.dart';

import '../../../common/app_colors.dart';

class CartScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Online shop',
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainBackground,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Cart',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32.0,
              ),
            ),
          ),
          Text(
            'Empty',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 24.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(200, 50),
                side: BorderSide(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductScreenPage()),
                );
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'ADD SOMETHING',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.shopping_basket,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
