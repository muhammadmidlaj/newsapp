// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

import 'package:news_app/domain/entity/news.dart';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

class NewsModel extends News {
  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        source: SourceModel.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  NewsModel({
    required super.source,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  Map<String, dynamic> toJson() => {
        "source": SourceModel(id: source.id, name: source.name).toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}

class SourceModel extends Source {
  SourceModel({
    required super.id,
    required super.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
