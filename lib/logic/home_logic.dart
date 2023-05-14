import 'package:flutter/widgets.dart';
import 'package:news_app/data/service/news_api.dart';
import 'package:news_app/models/news_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeLogic {
  final NewsApi _newsApi = NewsApi();

  final _newsController = BehaviorSubject<List<NewsModel>>();
  Stream<List<NewsModel>> get newsStream => _newsController.stream;

  void getNews(Map<String, dynamic> params) async {
    try {
      List<NewsModel> newsList = await _newsApi.getAllNews(params);
      _newsController.sink.add(newsList);
    } catch (e) {
      throw e;
    }
  }

  void dispose() {
    _newsController.close();
  }
}
