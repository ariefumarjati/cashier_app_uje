// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  double get total {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += item.price;
    }
    return totalPrice;
  }

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
