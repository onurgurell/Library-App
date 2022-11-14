import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/blocs/app_bloc/app_events.dart';
import 'package:library_app/blocs/app_bloc/app_state.dart';

import 'package:library_app/core/service/book_service.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final BookService _bookService;

  AppBloc(this._bookService) : super(AppLoadingState()) {
    on<AppEvent>((event, emit) async {
      emit(AppLoadingState());
      if (kDebugMode) {
        print('loading state $AppLoadingState');
      }
      try {
        final books = await _bookService.getBooks("");

        emit(AppLoadedState(books));
        if (kDebugMode) {
          print('loaded state $AppLoadedState');
        }
      } catch (e) {
        emit(AppErrorState(e.toString()));
      }
    });
  }
}
