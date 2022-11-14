import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_app/core/model/book_model.dart';

class FavouriteService {
  late Box<VolumeInfo> _volumeInfo;

  Future<void> init() async {
    Hive.registerAdapter(VolumeInfoAdapter());
    _volumeInfo = (await Hive.openBox<BookModel>('favBox')) as Box<VolumeInfo>;
  }

  Future<List<VolumeInfo>> getFavourite(
      String? title,
      List<String>? authors,
      String? publisher,
      String? publishedDate,
      String? description,
      int? pageCount,
      String? imageLinks) async {
    final fav = _volumeInfo.values.where((element) =>
        element.title == title &&
        element.authors == authors &&
        element.publisher == publisher &&
        element.publishedDate == publishedDate &&
        element.description == description &&
        element.pageCount == pageCount &&
        element.imageLinks == imageLinks);

    return fav.toList();
  }

  void addFav(
      String? title,
      List<String>? authors,
      String? publisher,
      String? publishedDate,
      String? description,
      int? pageCount,
      String? imageLinks) {
    _volumeInfo.add(VolumeInfo(
        authors: authors,
        publisher: publisher,
        publishedDate: publishedDate,
        description: description,
        pageCount: pageCount,
        imageLinks: imageLinks));
  }
}
