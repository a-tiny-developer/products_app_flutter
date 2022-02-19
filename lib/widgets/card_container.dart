import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(20),
      decoration: _createCardShape(),
      child: child,
    );
  }

  BoxDecoration _createCardShape() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 15,
          offset: Offset(0, 5),
        ),
      ],
    );
  }
}
