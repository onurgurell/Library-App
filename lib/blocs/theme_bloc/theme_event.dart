import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/helper/theme/app_themes.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent([List props = const <dynamic>[]]) : super();
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({required this.theme}) : super([theme]);

  @override
  List<Object?> get props => [theme];
}
