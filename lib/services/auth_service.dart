import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyCYd-Td7JfNXCgg5iIFBQEhprMWYFPjCBc';
  final storage = const FlutterSecureStorage();

  // if it returns something it is an error
  Future<String?> createUser(String email, String password) async {
    final authData = <String, dynamic>{
      'email': email,
      'password': password,
    };

    final url = Uri.https(_baseUrl, 'v1/accounts:signUp', {
      'key': _firebaseToken,
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    }
    return decodeResp['error']['message'];
  }

  Future<String?> loginUser(String email, String password) async {
    final authData = <String, dynamic>{
      'email': email,
      'password': password,
    };

    final url = Uri.https(_baseUrl, 'v1/accounts:signInWithPassword', {
      'key': _firebaseToken,
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    }
    return decodeResp['error']['message'];
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
