import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/product_entity.dart';
import '../manager/provider/cart_list_provider.dart';
import '../pages/cart_screen.dart';

class ProductDetailSheet extends StatelessWidget {
  final ProductEntity product;

  ProductDetailSheet({required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProducts = Provider.of<CartListProvider>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              product.image,
              width: 300,
              height: 400,
            ),
          ),
          const Divider(),
          Text(
            product.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Text(
                'Category',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                  product.category,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Text(
                'Rating',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              _ratingStars(product.rating.rate),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                '${product.price}\$',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Description',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                product.description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: _buttonViewDetailSheet(cartProducts, product, context),
          ),
        ],
      ),
    );
  }

  Widget _ratingStars(num rating) {
    List<Widget> icons = [];
    for (num i = rating; i > 0.75; i--) {
      icons.add(Icon(
        Icons.star,
        color: Colors.black,
      ));
      rating--;
    }
    if (rating > 0.25) {
      icons.add(Icon(
        Icons.star_half,
        color: Colors.black,
      ));
    }
    while (icons.length < 5) {
      icons.add(Icon(
        Icons.star_border,
        color: Colors.black,
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: icons,
    );
  }

  Widget _buttonViewDetailSheet(CartListProvider cartProducts,
      ProductEntity product, BuildContext context) {
    if (cartProducts.items.contains(product)) {
      return ElevatedButton(
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
            MaterialPageRoute(builder: (context) => CartScreenPage()),
          );
        },
        child: Row(
          children: [
            Expanded(
              child: Text(
                'GO TO CART',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )
          ],
        ),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: Size(200, 50),
          side: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),
        onPressed: () {
          Provider.of<CartListProvider>(context, listen: false)
              .addProduct(product);
        },
        child: Row(
          children: [
            Expanded(
              child: Text(
                'ADD TO CART',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            Icon(
              Icons.add_shopping_cart,
              color: Colors.black,
            )
          ],
        ),
      );
    }
  }
}
