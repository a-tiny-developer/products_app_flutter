import 'package:flutter/material.dart';
import 'package:products_app_flutter/theme/theme.dart';

class NotificationsService {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: AppTheme.text20,
      ),
    );
    messengerKey.currentState?.showSnackBar(snackBar);
  }
}
