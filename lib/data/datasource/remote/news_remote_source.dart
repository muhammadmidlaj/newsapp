import 'dart:convert';
import 'dart:developer';

import 'package:news_app/core/error/exception.dart';
import 'package:news_app/core/utils/api.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:http/http.dart' as http;


abstract class NewsRemoteSource {
  Future<List<NewsModel>> fetchAllNews();
}

class NewsRemoteSourceImpl implements NewsRemoteSource {
  final http.Client _httpClient;

  NewsRemoteSourceImpl(this._httpClient);

  @override
  Future<List<NewsModel>> fetchAllNews() async {
    final List<NewsModel> list = [];
    final url = Uri.parse(ApiConstants.topHeadlinesUrl);
    final response = await _httpClient.get(url);
    log(ApiConstants.topHeadlinesUrl);
    if (response.statusCode == 401 || response.statusCode == 404) {
      throw ApiException(
          message: response.body, errorCode: response.statusCode);
    }
    final json = jsonDecode(response.body);
    log(response.body);
    for (var element in json["articles"]) {
      list.add(NewsModel.fromJson(element));
    }
   

    return list;
  }
}
