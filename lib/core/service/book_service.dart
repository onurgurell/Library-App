import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:library_app/core/helper/constants.dart';
import 'package:library_app/core/model/book_model.dart';
import 'package:http/http.dart' as http;

class BookService {
  Future<List<Item>> getBooks(String query) async {
    // ignore: prefer_typing_uninitialized_variables
    var bookList;
    http.Response response = await http.get(Uri.parse(Constants.API_URL));
    if (kDebugMode) {
      print("Response: ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      BookModel bookModel = BookModel.fromJson(jsonDecode(response.body));
      bookList = bookModel.items;

      return bookList;
    } else {
      if (kDebugMode) {
        print('data not found');
      }
    }
    return bookList;
  }
}
