import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';

import '../services/news_services.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NewsService(Dio()).getGeneralNews(),
        builder: (context, snapshot) {
          return NewsListview(
            articles: snapshot.data ?? [],
          );
        });
    // isLoadig
    //     ? const SliverFillRemaining(
    //         hasScrollBody: false,
    //         child: Center(child: CircularProgressIndicator()),
    //       )
    //     : articles.isEmpty
    //         ? NewsListview(
    //             articles: articles,
    //           )
    //         : const SliverToBoxAdapter(
    //             child: Text("There is an error, try again later"),
    //           );
  }
}
