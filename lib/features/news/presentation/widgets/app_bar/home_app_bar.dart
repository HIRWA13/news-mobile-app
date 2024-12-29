import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/news_use_cases/article_use_cases.dart';
import 'package:news_app/features/news/presentation/widgets/app_bar/logo_text.dart';
import 'package:news_app/locator.dart';
import 'package:unicons/unicons.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({super.key});

  final ArticleUseCases articleUseCases = locator<ArticleUseCases>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.sort,
            color: Colors.white,
          ),
          onPressed: () async {},
        ),
      ),
      title: const LogoText(),
      centerTitle: true,
      actions: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 2,
              )),
          child: IconButton(
            icon: const Icon(
              UniconsLine.microphone,
              color: Colors.black,
              size: 34,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
