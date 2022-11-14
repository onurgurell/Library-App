import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  const ThemeState({required this.themeData}) : super();
  @override
  List<Object?> get props => [themeData];
}