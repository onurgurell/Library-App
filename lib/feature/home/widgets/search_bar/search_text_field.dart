import 'package:flutter/material.dart';
import 'package:library_app/core/helper/string_helper/string_helper.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 17),
        hintText: StringConstant.searchBarHintText,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.all(20),
      ),
    );
  }
}
