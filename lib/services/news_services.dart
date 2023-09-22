import 'package:dio/dio.dart';

import 'package:news_app_ui_setup/model/news_model.dart';

class NewsService {
  final Dio dio;

  final apiKey = "402e7b1e18b14ca8adf16af66a7c5317";

  NewsService(this.dio);

  Future<Map<String, dynamic>> getNewsResponse(
      {required String categoryName}) async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apikey=$apiKey");
    Map<String, dynamic> jsonData = response.data;

    return jsonData;
  }

  Future<Map<String, dynamic>> getSearchNewsResponse(
      {required String searchValue}) async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?q=$searchValue&apikey=$apiKey");
    Map<String, dynamic> jsonData = response.data;

    return jsonData;
  }

  Future<List<NewsModel>> getnews(
      {String? categoryName, String? searchValue}) async {
    List<dynamic> articles;
    if (categoryName != null) {
      Map<String, dynamic> jsonData =
          await getNewsResponse(categoryName: categoryName);
      articles = jsonData['articles'];
    } else {
      Map<String, dynamic> jsonData =
          await getSearchNewsResponse(searchValue: searchValue!);
      articles = jsonData['articles'];
    }

    List<NewsModel> articleList = [];
    for (var article in articles) {
      NewsModel newsModel = NewsModel(
          image: article['urlToImage'],
          title: article['title'],
          subtitle: article['description'],
          url: article['url']);
      articleList.add(newsModel);
    }
    return articleList;
  }
}
