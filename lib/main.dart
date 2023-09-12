// ignore_for_file: library_private_types_in_public_api

import 'package:cashier_app_uje/screens/cart_screen.dart';
import 'package:cashier_app_uje/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const CashierApp(),
    ),
  );
}

class CashierApp extends StatelessWidget {
  const CashierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cashier App Uje',
      initialRoute: '/',
      routes: {
        '/': (context) => const ProductScreen(),
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}
