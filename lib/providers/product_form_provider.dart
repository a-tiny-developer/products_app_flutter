import 'package:flutter/material.dart';

import '../models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  Product product;

  ProductFormProvider({required this.product});

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
