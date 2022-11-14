import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/blocs/app_bloc/app_bloc.dart';
import 'package:library_app/blocs/app_bloc/app_events.dart';
import 'package:library_app/blocs/app_bloc/app_state.dart';
import 'package:library_app/core/database/database.dart';
import 'package:library_app/core/model/book_model.dart';
import 'package:library_app/feature/home/widgets/alert/long_press_alert_dialog.dart';
import 'package:library_app/feature/home/widgets/search_bar/search_bar.dart';
import 'package:library_app/product/widgets/app_bar.dart';
import 'package:library_app/feature/home/widgets/book_card_widget/book_info_card_widget.dart';
import 'package:library_app/product/widgets/loading_widget.dart';

import '../../../core/helper/string_helper/string_helper.dart';
import '../../../core/service/book_service.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => AppBloc(
            RepositoryProvider.of<BookService>(context),
          )..add(AppLoadEvent())),
      child: Scaffold(
        backgroundColor: const Color(0xff1b262c),
        appBar: CustomAppBar(StringConstant.favBook),
        body: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is AppLoadingState) {
              const LoadingWidget();
            }
            if (state is AppLoadedState) {
              List<Item>? booksList = state.bookList;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SearchBar(
                      listbook: <VolumeInfo>[
                        for (var item in booksList) item.volumeInfo!
                      ].toList(),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: booksList.length,
                      itemBuilder: (context, index) {
                        VolumeInfo bookInfo =
                            booksList.elementAt(index).volumeInfo!;
                        return GestureDetector(
                          onLongPress: () {
                            _showDialog(context, index, booksList);
                          },
                          onDoubleTap: () async {
                            bool isAdded = await Database().addToBox(bookInfo);
                            if (kDebugMode) {
                              print(isAdded.toString());
                            }
                          },
                          child: BookInfoCardWidget(
                            volumeInfo: bookInfo,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            if (state is AppErrorState) {
              return const Center(
                child: Text('errorrrr'),
              );
            }
            return const SizedBox(child: LoadingWidget());
          },
        ),
      ),
    );
  }

  Future<dynamic> _showDialog(
      BuildContext context, int index, List<Item> booklist) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return LongPressAlert(
          booksList: booklist,
          index: index,
        );
      },
    );
  }
}
