import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/news_model.dart';
import 'package:news_app_ui_setup/services/news_services.dart';

import 'package:news_app_ui_setup/widgets/news_tile.dart';

class NewsListview extends StatefulWidget {
  const NewsListview({
    super.key,
  });

  @override
  State<NewsListview> createState() => _NewsListviewState();
}

class _NewsListviewState extends State<NewsListview> {
  List<NewsModel> articles = [];
  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsService(Dio()).getGeneralNews();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22.0),
            child: NewsTile(news: articles[index]),
          );
        },
      ),
    );
  }
}
// const CategoriesListView()