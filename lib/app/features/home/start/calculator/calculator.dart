import 'package:flutter/material.dart';

class CalculatorPageContent extends StatelessWidget {
  const CalculatorPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Kalkulator',
      style: TextStyle(color: Colors.white),
    ));
  }
}
