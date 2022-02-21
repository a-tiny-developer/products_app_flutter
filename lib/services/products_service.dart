import 'package:flutter/material.dart';
import 'package:products_app_flutter/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'product-app-flutter-default-rtdb.firebaseio.com';

  final products = <Product>[];

  // TODO: fetch products
}
