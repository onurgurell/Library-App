import 'package:flutter/material.dart';
import 'package:library_app/core/model/book_model.dart';
import 'package:library_app/feature/home/widgets/search_bar/search_bar_animation.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  SearchBar({super.key, required this.listbook});
  List<VolumeInfo> listbook;

  @override
  Widget build(BuildContext context) {
    return AnimationSearchBar(
      list: <VolumeInfo>[for (var item in listbook) item],
    );
  }
}
