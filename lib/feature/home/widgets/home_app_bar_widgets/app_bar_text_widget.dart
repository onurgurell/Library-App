import 'package:flutter/material.dart';

class AppBarTextWidget extends StatelessWidget {
  const AppBarTextWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 32),
    );
  }
}
