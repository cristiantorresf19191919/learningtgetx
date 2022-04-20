import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/product.dart';

class GlobalController extends GetxController {
  List<Product> _products = [];
  Map<String, Product> _favorites = Map();
  Map<String, Product> get favorites => _favorites;
  List<Product> get products => _products;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("😊 oninit globalcontroller");
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String productsStr =
        await rootBundle.loadString('assets/products.json');
    _products =
        (jsonDecode(productsStr) as List).map((e) => Product.test(e)).toList();
    print("🤣 Products loaded");
    update(['products']);
  }

  onFavorite(int index, bool isFavorite) {
    Product product = _products[index];
    product.isFavorite = isFavorite;
    if (isFavorite) {
      _favorites[product.name] = product;
    } else {
      _favorites.remove(product.name);
    }
    update(['products', 'favorites']);
  }
}
