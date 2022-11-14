// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:library_app/core/helper/string_helper/string_helper.dart';
import 'package:library_app/product/widgets/text_widget.dart';

class SearchButton extends StatelessWidget {
  //List<VolumeInfo> list;
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .07,
      child: ElevatedButton(
          onPressed: (() {}),
          child: const TextStyleGenerator(
            text: StringConstant.searchBarHintText,
            fontSize: 25,
          )),
    );
  }
}
