import 'package:news_app/domain/entity/news.dart';
import 'package:news_app/domain/repository/news_repository.dart';

class AddToFavouriteUseCase {
  final NewsRepository _newsRepository;

  AddToFavouriteUseCase(this._newsRepository);

  void call(News news) {
    return _newsRepository.addTofavourite(news);
  }
}
