import 'package:flutter/material.dart';

import '../../feature/home/widgets/home_app_bar_widgets/app_bar_fav_ıcon.dart';
import '../../feature/home/widgets/home_app_bar_widgets/app_bar_text_widget.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  CustomAppBar(
    this.title, {
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff1b262c),
      actions: const [AppBarFavIcon()],
      centerTitle: false,
      title: InkWell(
          onTap: () {
            //Database().getFav();
          },
          child: AppBarTextWidget(title: title)),
      automaticallyImplyLeading: true,
    );
  }
}
