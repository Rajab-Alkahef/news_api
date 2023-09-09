import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/news_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.news});

  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            news.image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          news.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          news.subtitle,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
