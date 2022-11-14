// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';

import 'package:library_app/core/database/database.dart';
import 'package:library_app/core/model/book_model.dart';
import 'package:library_app/product/widgets/text_widget.dart';

// ignore: must_be_immutable
class LongPressAlert extends StatelessWidget {
  int index;
  List<Item> booksList;

  LongPressAlert({super.key, required this.index, required this.booksList});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Are You Sure"),
      content:
          const Text("if you delete it will be removed from your favourites."),
      actions: <Widget>[
        ElevatedButton(
          child: const TextStyleGenerator(
            text: 'YES',
          ),
          onPressed: () async {
            await Database().delete(booksList[index].volumeInfo!);
            // ignore: use_build_context_synchronously
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const TextStyleGenerator(
            text: 'NO',
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
