import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_app/core/model/book_model.dart';
import 'package:library_app/core/service/book_service.dart';
import 'package:library_app/core/service/fav_service.dart';
import 'core/helper/string_helper/string_helper.dart';
import 'feature/home/view/home_page.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);
  Hive.registerAdapter(VolumeInfoAdapter());
  await Hive.openBox<VolumeInfo>("FavouriteBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: StringConstant.favBook,
            theme: ThemeData(
              brightness: Brightness.dark,
            ),
            home: MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  create: (context) => BookService(),
                ),
                RepositoryProvider(
                  create: (context) => FavouriteService(),
                )
              ],
              child: const HomePageView(),
            ),
          );
        });
  }
}
