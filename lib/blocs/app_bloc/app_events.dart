import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class AppLoadEvent extends AppEvent {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class FavEvent extends AppEvent {
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  String? imageLinks;

  FavEvent(this.title, this.authors, this.publisher, this.publishedDate,
      this.description, this.pageCount, this.imageLinks);

  @override
  List<Object?> get props =>
      [authors, publisher, publishedDate, description, pageCount, imageLinks];
}
