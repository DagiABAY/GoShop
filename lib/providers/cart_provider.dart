import 'package:flutter/material.dart';
import 'package:goshop/model/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> products = [];

  List<Product> get getProducts => products;

  void add(Product item) {
    item.favorite = true;
    products.add(item);
    notifyListeners();
  }

  void removeProduct(Product item) {
    item.favorite = false;
    products.remove(item);
    notifyListeners();
  }

  void removeAll() {
    products.clear();
    notifyListeners();
  }

  bool addFaviourite(Product item) {
    for (var element in products) {
      if (element.id == item.id) {
        element.favorite = !item.favorite;
        return element.favorite;
      } else {
        return !element.favorite;
      }
    }
    return !item.favorite;
  }

  double getTotalPrice() {
    return products.fold(
        0, (previousValue, element) => previousValue + element.price);
  }
}
