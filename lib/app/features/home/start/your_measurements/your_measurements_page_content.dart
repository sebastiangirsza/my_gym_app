import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class YourMeasurementsPageContent extends StatelessWidget {
  const YourMeasurementsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Pomiary',
      style: TextStyle(color: Colors.white),
    ));
  }
}
