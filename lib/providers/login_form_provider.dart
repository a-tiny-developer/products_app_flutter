import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  var email = '';
  var password = '';

  var _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
