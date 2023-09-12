import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/model/news_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  void getGeneralNews() async {
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?apiKey=943f042ccfb14007b017520af9d3a8e1&country=eg&category=general');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];

    List<NewsModel> articleList = [];

    for (var article in articles) {
      NewsModel newsmodel = NewsModel(
          image: article['urlToImage'],
          title: article['title'],
          subtitle: article['description']);

      articleList.add(newsmodel);
    }
    print(articleList);
  }
}
