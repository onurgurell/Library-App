// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';

import 'package:library_app/core/helper/string_helper/string_helper.dart';
import 'package:library_app/core/model/book_model.dart';
import 'package:library_app/product/widgets/text_widget.dart';

// ignore: must_be_immutable
class CardInfo extends StatelessWidget {
  VolumeInfo? volumeInfo;

  CardInfo({super.key, required this.volumeInfo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bookTitle(),
            const SizedBox(
              height: 5,
            ),
            _divider(context),
            _bookAuthor(),
            _bookPublisher(),
            const Spacer(),
            _bookDateAndPages()
          ],
        ),
      ),
    );
  }

  Text _bookTitle() {
    return Text(
      volumeInfo!.title.toString(),
      style: const TextStyle(fontSize: 22),
    );
  }

  SizedBox _divider(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      height: 10,
      child: const Divider(
        color: Colors.grey,
      ),
    );
  }

  Row _bookAuthor() {
    return Row(
      children: [
        const TextStyleGenerator(
          text: StringConstant.author,
        ),
        TextStyleGenerator(
          text: volumeInfo!.authors
              .toString()
              .substring(1, volumeInfo!.authors.toString().length - 1)
              .toString(),
          fontSize: 11,
        )
      ],
    );
  }

  Row _bookPublisher() {
    return Row(
      children: [
        const TextStyleGenerator(
          text: StringConstant.publisher,
        ),
        TextStyleGenerator(
          text: volumeInfo!.publisher.toString(),
        )
      ],
    );
  }

  Row _bookDateAndPages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TextStyleGenerator(
          text: StringConstant.publishAt,
          fontSize: 11,
        ),
        TextStyleGenerator(
          text: volumeInfo!.publishedDate.toString(),
          fontSize: 11,
        ),
        const TextStyleGenerator(
          text: StringConstant.pages,
          fontSize: 11,
        ),
        TextStyleGenerator(
          text: volumeInfo!.pageCount.toString(),
        ),
      ],
    );
  }
}
