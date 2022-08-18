import 'package:flutter/material.dart';

class StartPageContent extends StatefulWidget {
  const StartPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<StartPageContent> createState() => _StartPageContentState();
}

class _StartPageContentState extends State<StartPageContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Dwa'),
    );
  }
}
