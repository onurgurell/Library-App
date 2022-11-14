import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchIcon extends StatelessWidget {
  IconData icon;
  SearchIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 20,
      color: Colors.grey,
    );
  }
}
