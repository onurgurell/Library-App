import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_app/core/model/book_model.dart';

class Database {
  static const String _boxName = 'FavouriteBox';

  static final box = Hive.box<VolumeInfo>(_boxName);

  Future<Box> openBox() async {
    return await Hive.openBox<VolumeInfo>(_boxName);
  }

  Future<List<VolumeInfo>?> getFav() async {
    var box = await openBox();
    List<VolumeInfo>? boxList = box.values.cast<VolumeInfo>().toList();

    for (var a in boxList) {
      if (kDebugMode) {
        print(a.title.toString());
      }
      if (kDebugMode) {
        print(a.imageLinks.toString());
      }
    }

    return boxList;
  }

  Future<bool> addToBox(VolumeInfo volumeInfo) async {
    var box = await openBox();

    if (box.containsKey(volumeInfo.key)) {
      return false;
    } else {
      await box.add(volumeInfo);
      return true;
    }
  }

  delete(VolumeInfo volumeInfo) async {
    var box = await openBox();

    box.delete(volumeInfo.key);
  }

  clear(VolumeInfo volumeInfo) async {
    var box = await openBox();

    box.clear();
  }
}
