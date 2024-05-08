import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/domain/entity/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> fetchAllNews();
  void addTofavourite(News news);
  List<News> fetchAllFavourites();
}
