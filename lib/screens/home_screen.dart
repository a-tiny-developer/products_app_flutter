import 'package:flutter/material.dart';
import 'package:products_app_flutter/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBackground(),
    );
  }
}
