import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/model/news_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<NewsModel>> getTopHeadlinesNews(
      {required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=943f042ccfb14007b017520af9d3a8e1');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];

      List<NewsModel> articleList = [];

      for (var article in articles) {
        NewsModel newsmodel = NewsModel(
            url: article['url'],
            image: article['urlToImage'],
            title: article['title'],
            subtitle: article['description']);

        articleList.add(newsmodel);
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
