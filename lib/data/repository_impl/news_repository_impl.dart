import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/network/network.dart';
import 'package:news_app/data/datasource/local/news_local_source.dart';
import 'package:news_app/data/datasource/remote/news_remote_source.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/domain/entity/news.dart';
import 'package:news_app/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteSource _newsRemoteSource;
  final NewsLocalSource _newsLocalSource;
  final ConnectionChecker _connectionChecker;

  NewsRepositoryImpl(
      this._newsRemoteSource, this._newsLocalSource, this._connectionChecker);
  @override
  Future<Either<Failure, List<News>>> fetchAllNews() async {
    try {
      if (!await (_connectionChecker.isConnected)) {
        final response = _newsLocalSource.fetchAllNews();
        return Right(response);
      }
      final response = await _newsRemoteSource.fetchAllNews();
      _newsLocalSource.insertNews(news: response);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(message: e.message, errorCode: e.errorCode));
    }
  }

  @override
  void addTofavourite(News news) {
    NewsModel newsModel = NewsModel(
        source: news.source,
        author: news.author,
        title: news.title,
        description: news.description,
        url: news.url,
        urlToImage: news.urlToImage,
        publishedAt: news.publishedAt,
        content: news.content);
    _newsLocalSource.addToFavourite(newsModel);
  }

  @override
  List<News> fetchAllFavourites() {
    return _newsLocalSource.fetchAllFavourites();
  }
}
