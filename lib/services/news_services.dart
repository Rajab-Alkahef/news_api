import 'package:dio/dio.dart';

import 'package:news_app_ui_setup/model/news_model.dart';

// class NewsService {
//   final Dio dio;

//   final apiKey = "402e7b1e18b14ca8adf16af66a7c5317";

//   NewsService(this.dio);

//   Future<Map<String, dynamic>> getNewsResponse(
//       {required String categoryName}) async {
//     Response response = await dio.get(
//         "https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apikey=$apiKey");
//     Map<String, dynamic> jsonData = response.data;

//     return jsonData;
//   }

//   Future<Map<String, dynamic>> getSearchNewsResponse(
//       {required String searchValue}) async {
//     Response response = await dio.get(
//         "https://newsapi.org/v2/top-headlines?q=$searchValue&apikey=$apiKey");
//     Map<String, dynamic> jsonData = response.data;

//     return jsonData;
//   }

//   Future<List<NewsModel>> getnews(
//       {String? categoryName, String? searchValue}) async {
//     return await Future.delayed(const Duration(seconds: 1), () async {
//       List<dynamic> articles;
//       if (categoryName != null) {
//         Map<String, dynamic> jsonData =
//             await getNewsResponse(categoryName: categoryName);
//         articles = jsonData['articles'];
//       } else {
//         Map<String, dynamic> jsonData =
//             await getSearchNewsResponse(searchValue: searchValue!);
//         articles = jsonData['articles'];
//       }

//       List<NewsModel> articleList = [];
//       for (var article in articles) {
//         NewsModel newsModel = NewsModel(
//             image: article['urlToImage'],
//             title: article['title'],
//             subtitle: article['description'],
//             url: article['url']);
//         articleList.add(newsModel);
//       }
//       return articleList;
//     });
//   }
// }

class NewsService {
  final Dio dio;

  final apiKey = "pub_30054b3908a426e55b0ebdf8c4a4eeaa317a0";

  NewsService(this.dio);

  Future<Map<String, dynamic>> getNewsResponse(
      {required String categoryName}) async {
    Response response = await dio.get(
        "https://newsdata.io/api/1/news?apikey=$apiKey&category=$categoryName&image=1&country=sa,eg,es,sy,gb");
    Map<String, dynamic> jsonData = response.data;

    return jsonData;
  }

  Future<Map<String, dynamic>> getSearchNewsResponse(
      {required String searchValue, required String filterValue}) async {
    Map<String, dynamic> jsonData;
    if (filterValue != "T") {
      Response response = await dio.get(
          "https://newsdata.io/api/1/news?apikey=$apiKey&category=$filterValue&q=$searchValue&image=1");
      jsonData = response.data;
    } else {
      Response response = await dio.get(
          "https://newsdata.io/api/1/news?apikey=$apiKey&q=$searchValue&image=1");

      jsonData = response.data;
    }
    return jsonData;
  }

  Future<List<NewsModel>> getnews(
      {String? categoryName, String? searchValue, String? filterValue}) async {
    List<dynamic> articles;
    if (categoryName != null) {
      Map<String, dynamic> jsonData =
          await getNewsResponse(categoryName: categoryName);
      articles = jsonData['results'];
    } else {
      Map<String, dynamic> jsonData = await getSearchNewsResponse(
          searchValue: searchValue!, filterValue: filterValue!);
      articles = jsonData['results'];
    }

    List<NewsModel> articleList = [];
    for (var article in articles) {
      NewsModel newsItemModel = NewsModel(
          image: article['image_url'],
          title: article['title'],
          subtitle: article['description'],
          url: article['link']);
      articleList.add(newsItemModel);
    }
    return articleList;
  }
}










// class NewsService {
//   final Dio dio;

//   //final apiKey = "402e7b1e18b14ca8adf16af66a7c5317";
  
//   NewsService(this.dio);

//   Future<Map<String, dynamic>> getNewsResponse(
//       {required String categoryName}) async {
//     Response response = await dio.get(
//         "https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apikey=$apiKey");
//     Map<String, dynamic> jsonData = response.data;

//     return jsonData;
//   }

//   Future<Map<String, dynamic>> getSearchNewsResponse(
//       {required String searchValue}) async {
//     Response response = await dio.get(
//         "https://newsapi.org/v2/top-headlines?q=${searchValue}&apikey=$apiKey");
//     Map<String, dynamic> jsonData = response.data;

//     return jsonData;
//   }

//   Future<List<NewsItemModel>> getnews(
//       {String? categoryName, String? searchValue}) async {
//     List<dynamic> articles;
//     if (categoryName != null) {
//       Map<String, dynamic> jsonData =
//           await getNewsResponse(categoryName: categoryName);
//       articles = jsonData['articles'];
//     } else {
//       Map<String, dynamic> jsonData =
//           await getSearchNewsResponse(searchValue: searchValue!);
//       articles = jsonData['articles'];
//     }

//     List<NewsItemModel> articleList = [];
//     for (var article in articles) {
//       NewsItemModel newsItemModel = NewsItemModel(
//           image: article['urlToImage'],
//           title: article['title'],
//           description: article['description'],
//           url: article['url']);
//       articleList.add(newsItemModel);
//     }
//     return articleList;
//   }
// }