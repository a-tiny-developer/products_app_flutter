import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  var email = '';
  var password = '';

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
