import 'package:flutter/material.dart';

class CalendarPageContent extends StatelessWidget {
  const CalendarPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Kalendarz',
      style: TextStyle(color: Colors.white),
    ));
  }
}
