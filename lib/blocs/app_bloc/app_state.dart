import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/model/book_model.dart';

@immutable
abstract class AppState extends Equatable {}

//loading state
class AppLoadingState extends AppState {
  @override
  List<Object?> get props => [];
}

//loaded state
// ignore: must_be_immutable
class AppLoadedState extends AppState {
  AppLoadedState(this.bookList);
  final List<Item> bookList;
  List<Widget> favCardList = [];

  @override
  List<Object?> get props => [bookList];
}

//error state
class AppErrorState extends AppState {
  AppErrorState(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}
