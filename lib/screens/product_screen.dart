// ignore_for_file: library_private_types_in_public_api

import 'package:cashier_app_uje/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:intl/intl.dart';
import '../models/product.dart';

final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ');

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products = [
    Product('https://picsum.photos/id/30/200', 'Product 1', 15999),
    Product('https://picsum.photos/id/31/200', 'Product 2', 24596),
    Product('https://picsum.photos/id/32/200', 'Product 3', 31959),
    Product('https://picsum.photos/id/33/200', 'Product 4', 9578),
    Product('https://picsum.photos/id/36/200', 'Product 5', 55999),
    Product('https://picsum.photos/id/37/200', 'Product 6', 34596),
    Product('https://picsum.photos/id/39/200', 'Product 7', 21959),
    Product('https://picsum.photos/id/35/200', 'Product 8', 1578),
  ];

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        actions: [
          badges.Badge(
            badgeContent: Text(
              cartProvider.cartItems.length.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(products[index].image),
            title: Text(products[index].title),
            subtitle: Text(currencyFormat.format(products[index].price)),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                cartProvider.addToCart(products[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
