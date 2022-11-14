import 'package:flutter/material.dart';
import 'package:library_app/core/model/book_model.dart';
import 'package:library_app/feature/home/widgets/book_card_widget/card_book_image.dart';
import 'package:library_app/feature/home/widgets/book_card_widget/card_infos.dart';

// ignore: must_be_immutable
class BookInfoCardWidget extends StatelessWidget {
  VolumeInfo? volumeInfo;
  BookInfoCardWidget({
    super.key,
    required this.volumeInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff1b262c),
      child: Container(
        margin: const EdgeInsets.all(7),
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue)),
        height: MediaQuery.of(context).size.height * .24,
        child: Row(
          children: [
            BookCardImage(
              volumeInfo: volumeInfo,
            ),
            const SizedBox(
              width: 8,
            ),
            CardInfo(
              volumeInfo: volumeInfo,
            ),
          ],
        ),
      ),
    );
  }
}
