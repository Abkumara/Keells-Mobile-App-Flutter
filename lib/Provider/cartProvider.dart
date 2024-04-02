import 'package:flutter/material.dart';

import 'package:keellsapp/Model/item.dart';

class ItemCart extends ChangeNotifier {
  final List<Item> _cartItems = [];
  List<Item> get cartItems => _cartItems;
  final List<int> _itemCount = [];
  List<int> get itemCount => _itemCount;

  void addToCart(
    Item item,
    int count,
  ) {
    _cartItems.add(item);
    _itemCount.add(count);

    notifyListeners();
  }

  void removeCart() {
    _cartItems.clear();
    _itemCount.clear();
  }
}

double calculate(double itemPrice, int count) {
  return itemPrice * count;
}
