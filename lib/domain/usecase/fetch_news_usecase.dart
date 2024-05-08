import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/domain/entity/news.dart';
import 'package:news_app/domain/repository/news_repository.dart';

class FetchNewsUseCase implements UseCaseWithoutParams<List<News>> {
  final NewsRepository _newsRepository;

  FetchNewsUseCase(this._newsRepository);
  @override
  Future<Either<Failure, List<News>>> call() async {
    return _newsRepository.fetchAllNews();
  }
}
