import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = '';

  Future<String?> createUser(String email, String password) async {
    final authData = <String, dynamic>{
      'email': email,
      'password': password,
    };

    final url = Uri.https(_baseUrl, 'v1/accounts:signUp', {
      'key': _firebaseToken,
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String,dynamic> decodeResp = json.decode(resp.body);
  }
}
