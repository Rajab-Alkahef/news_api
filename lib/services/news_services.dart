import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsService {
  final Dio dio;

  NewsService({required this.dio});

  void getGeneralNews() async {
    final response = await dio.get(
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=943f042ccfb14007b017520af9d3a8e1');
    print(response);
  }

  void getSportsNews() async {
    final response = await dio.get(
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=943f042ccfb14007b017520af9d3a8e1');
    print(response);
  }
}
