import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/model/book_model.dart';

// ignore: must_be_immutable
class BookCardImage extends StatelessWidget {
  VolumeInfo? volumeInfo;

  BookCardImage({super.key, required this.volumeInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.height * .3,
      child: CachedNetworkImage(
        imageUrl: volumeInfo!.imageLinks!.toString(),
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator.adaptive(
                value: downloadProgress.progress)),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
