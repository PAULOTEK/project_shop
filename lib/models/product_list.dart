import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/viewModel/data/dummy_data.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems => _items.where((prod) => prod.isFavorite).toList();

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
