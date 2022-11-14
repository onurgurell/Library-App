// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:library_app/feature/favourite_page/view/fav_page.dart';

class AppBarFavIcon extends StatelessWidget {
  const AppBarFavIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const FavouritePage())));
          },
          child: const Icon(Icons.favorite)),
    );
  }
}
