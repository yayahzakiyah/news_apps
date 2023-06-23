import 'dart:convert';

import 'package:news_app/data/api/api_helper.dart';
import 'package:news_app/data/api/endpoint.dart';
import 'package:news_app/models/news_model.dart';

class NewsApi {
  Future<dynamic> getAllNews(Map<String, dynamic> params) async {
    try {
      final response =
          await ApiHelper.get(Endpoints.allNews, queryParameter: params);
      List<NewsModel> news = [];
      for (var json in response.data['articles']) {
        news.add(NewsModel.fromJson(json));
      }
      return news;
    } catch (e) {
      print('error news');
      print(e);
      return e;
    }
  }

  Future<dynamic> getHeadlinesNews(Map<String, dynamic> params) async {
    try {
      final response =
          await ApiHelper.get(Endpoints.topHeadlines, queryParameter: params);
      List<NewsModel> news = [];
      for (var json in response.data['articles']) {
        news.add(NewsModel.fromJson(json));
      }
      return news;
    } catch (e) {
      print('error headlines');
      print(e);
      return e;
    }
  }
}
