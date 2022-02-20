import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 50,
        left: 20,
        right: 20,
      ),
      width: double.infinity,
      height: 400,
      color: Colors.red,
    );
  }
}
