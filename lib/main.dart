import 'package:flutter/material.dart';
import 'package:goshop/modules/cart_page.dart';
import 'package:goshop/modules/product_page.dart';
import 'package:goshop/modules/success_buy.dart';
import 'package:goshop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoShop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Product(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/products",
      routes: {
        "/products": (context) => const Product(),
        "/cart": (context) => const CartPage(),
        "/success": (context) => const SuccessBuy()
        
      },
    );
  }
}
