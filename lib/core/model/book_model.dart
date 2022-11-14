import 'package:hive/hive.dart';
part 'book_model.g.dart';

class BookModel {
  BookModel({this.items});

  List<Item>? items;

  BookModel.fromJson(Map<String, dynamic> json) {
    var list = json["items"] as List;
    List<Item> itemsList = list.map((e) => Item.fromJson(e)).toList();
    items = itemsList;
  }
}

class Item {
  String? id;
  VolumeInfo? volumeInfo;

  Item({this.id, this.volumeInfo});

  Item.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    volumeInfo = VolumeInfo.fromJson(json["volumeInfo"]);
  }
}

@HiveType(typeId: 0)
class VolumeInfo extends HiveObject {
  @HiveField(1)
  String? title;
  @HiveField(2)
  List<String>? authors;
  @HiveField(3)
  String? publisher;
  @HiveField(4)
  String? publishedDate;
  @HiveField(5)
  String? description;
  @HiveField(6)
  int? pageCount;
  @HiveField(7)
  String? imageLinks;

  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.imageLinks,
  });

  VolumeInfo.fromJson(Map<dynamic, dynamic> json) {
    var responseAuthors = json["authors"] as List;
    List<String>? authorsList =
        responseAuthors.map((e) => e.toString()).toList();
    title = json["title"];
    authors = authorsList;
    publisher = json["publisher"];
    publishedDate = json["publishedDate"];
    description = json["description"];
    pageCount = json["pageCount"];
    imageLinks = json["imageLinks"]["smallThumbnail"];
  }
}
