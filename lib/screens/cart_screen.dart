// ignore_for_file: library_private_types_in_public_api

import 'package:cashier_app_uje/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ');

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(cartProvider.cartItems[index].image),
            title: Text(cartProvider.cartItems[index].title),
            subtitle: Text(
                currencyFormat.format(cartProvider.cartItems[index].price)),
            trailing: IconButton(
              icon: const Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cartProvider.removeFromCart(cartProvider.cartItems[index]);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Total: ${currencyFormat.format(cartProvider.total)}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
