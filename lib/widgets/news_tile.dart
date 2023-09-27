import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/news_model.dart';
import 'package:news_app_ui_setup/views/news_view.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.news});

  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return NewsView(
                url: news.url ?? 'page not found',
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: news.image != null
                ? CachedNetworkImage(
                    fit: BoxFit.fill,
                    height: 200,
                    width: double.infinity,
                    imageUrl: news.image!,
                    placeholder: (context, url) => const SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 4,
                        color: Colors.black,
                      )),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : const SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: Text('image not found'),
                    ),
                  ),
            // Image.network(
            //     news.image!,
            //     scale: 1.0,
            //     height: 200,
            //     width: double.infinity,
            //     fit: BoxFit.cover,
            //   )
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            news.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            news.subtitle ?? 'There is no subtitle for this news',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
