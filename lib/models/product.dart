import 'dart:convert';

import 'package:flutter/services.dart';

class Product {
  final int id;
  final String name, description;
  final double price, rate;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.rate});

  static Product fromJSON(Map<String, dynamic> json) {
    return Product(
        id: json['Product ID'],
        name: json['Name'],
        description: json['Description'],
        price: json['Price'].toDouble(),
        rate: json['Retail Price'].toDouble());
  }
}
