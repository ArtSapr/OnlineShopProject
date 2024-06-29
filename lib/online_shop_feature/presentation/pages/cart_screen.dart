import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_shop_project/online_shop_feature/presentation/pages/product_screen.dart';
import 'package:provider/provider.dart';

import '../../../common/app_colors.dart';
import '../manager/provider/cart_list_provider.dart';

class CartScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProducts = Provider.of<CartListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(8),
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
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Cart',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32.0,
              ),
            ),
          ),
          _productsOrEmpty(cartProducts),
          _buttonView(cartProducts, context),
        ],
      ),
    );
  }

  Widget _productsOrEmpty(CartListProvider cartProducts) {
    if (cartProducts.items.isEmpty) {
      return Text(
        'Empty',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 24.0,
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: cartProducts.items.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Image.network(
                          cartProducts.items[index].image,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cartProducts.items[index].title,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${cartProducts.items[index].price}\$',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  cartProducts.removeItemAt(index);
                                },
                                icon: Icon(
                                  Icons.remove_shopping_cart,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }

  Widget _buttonView(CartListProvider cartProducts, BuildContext context) {
    if (cartProducts.items.isEmpty) {
      return Padding(
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
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
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
                  'BUY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Icon(
                Icons.shopping_basket,
                color: Colors.white,
              )
            ],
          ),
        ),
      );
    }
  }
}
