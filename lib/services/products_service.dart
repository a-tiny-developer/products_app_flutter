import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:products_app_flutter/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'product-app-flutter-default-rtdb.firebaseio.com';
  final products = <Product>[];
  late Product selectedProduct;

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  ProductsService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();
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
    isLoading = false;
    notifyListeners();

    return products;
  }

  Future<void> saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();
    if (product.id == null) {
      await createProduct(product);
    } else {
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    await http.put(url, body: product.toJson());
    final productIndex =
        products.indexWhere((element) => element.id == product.id);
    products[productIndex] = product;
    return product.id!;
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final response = await http.post(url, body: product.toJson());
    final Map<String, dynamic> decodedData = json.decode(response.body);
    product.id = decodedData['name'];
    products.add(product);
    return product.id!;
  }

  void updateSelectedProductImage(String path) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }
}
