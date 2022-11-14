import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/model/book_model.dart';
import 'package:library_app/feature/home/widgets/book_card_widget/book_info_card_widget.dart';
import 'package:library_app/product/widgets/text_widget.dart';
import 'package:search_page/search_page.dart';

// ignore: must_be_immutable
class AnimationSearchBar extends StatelessWidget {
  List<VolumeInfo> list;

  AnimationSearchBar({
    required this.list,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(
            context: context,
            delegate: SearchPage<VolumeInfo>(
                items: list,
                searchLabel: 'Search book',
                suggestion: const Center(
                  child: Text('Filter books by book name'),
                ),
                failure: const Center(
                  child: Text('No person found :('),
                ),
                filter: (book) => [
                      book.title,
                      book.authors.toString(),
                      book.publisher,
                      book.pageCount.toString(),
                      book.description,
                      book.imageLinks,
                    ],
                builder: (book) => BookInfoCardWidget(volumeInfo: book)));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(.5),
        ),
        width: MediaQuery.of(context).size.width - 10,
        height: 50,
        child: Row(
          children: [
            8.w.horizontalSpace,
            const Icon(
              Icons.search,
            ),
            8.w.horizontalSpace,
            TextStyleGenerator(
              text: "Search here...",
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
