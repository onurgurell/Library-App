import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:library_app/core/database/database.dart';

import 'package:library_app/core/helper/string_helper/string_helper.dart';
import 'package:library_app/core/model/book_model.dart';
import 'package:library_app/feature/home/widgets/book_card_widget/book_info_card_widget.dart';
import 'package:library_app/product/widgets/app_bar.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b262c),
      appBar: CustomAppBar(StringConstant.favBook),
      body: ValueListenableBuilder(
        valueListenable: Database.box.listenable(),
        builder: (context, Box<VolumeInfo> box, _) {
          return ListView.builder(
            itemCount: Database.box.length,
            itemBuilder: (context, index) {
              final book = Database.box.getAt(index)!;
              return BookInfoCardWidget(
                volumeInfo: book,
              );
            },
          );
        },
      ),
    );
  }
}
