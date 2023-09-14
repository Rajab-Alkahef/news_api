import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/news_model.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';

import '../services/news_services.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  List<NewsModel> articles = [];
  bool isLoadig = true;
  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsService(Dio()).getGeneralNews();
    isLoadig = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoadig
        ? const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator()),
          )
        : NewsListview(
            articles: articles,
          );
  }
}
