import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/news_model.dart';
import 'package:news_app_ui_setup/widgets/news_tile.dart';

class NewsListview extends StatelessWidget {
  const NewsListview({
    super.key,
  });
  final List<NewsModel> news = const [
    NewsModel(
        image:
            'https://images.unsplash.com/photo-1613842683240-19b2880f1e9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80',
        title:
            'This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title ',
        subtitle:
            'This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle '),
    NewsModel(
        image:
            'https://images.unsplash.com/photo-1613842683240-19b2880f1e9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80',
        title:
            'This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title ',
        subtitle:
            'This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle '),
    NewsModel(
        image:
            'https://images.unsplash.com/photo-1613842683240-19b2880f1e9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80',
        title:
            'This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title ',
        subtitle:
            'This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle '),
    NewsModel(
        image:
            'https://images.unsplash.com/photo-1613842683240-19b2880f1e9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80',
        title:
            'This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title ',
        subtitle:
            'This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle '),
    NewsModel(
        image:
            'https://images.unsplash.com/photo-1613842683240-19b2880f1e9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80',
        title:
            'This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title ',
        subtitle:
            'This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle '),
    NewsModel(
        image:
            'https://images.unsplash.com/photo-1613842683240-19b2880f1e9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80',
        title:
            'This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title ',
        subtitle:
            'This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle '),
    NewsModel(
        image:
            'https://images.unsplash.com/photo-1613842683240-19b2880f1e9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80',
        title:
            'This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title This is title ',
        subtitle:
            'This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle This is subtitle ')
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22.0),
            child: NewsTile(
              news: news[index],
            ),
          );
        });
  }
}
// const CategoriesListView()