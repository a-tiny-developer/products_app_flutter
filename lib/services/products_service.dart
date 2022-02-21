import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:products_app_flutter/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'product-app-flutter-default-rtdb.firebaseio.com';
  final products = <Product>[];
  bool isLoading = true;

  ProductsService() {
    loadProducts();
  }

  Future<void> loadProducts() async {
    final url = Uri.https(_baseUrl, 'products.json');
    final response = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(response.body);
    productsMap.forEach(
      (key, value) {
        final tempProduct = Product.fromMap(value);
        tempProduct.id = key;
        products.add(tempProduct);
      },
    );
  }
}
