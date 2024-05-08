import 'package:news_app/domain/entity/news.dart';
import 'package:news_app/domain/repository/news_repository.dart';

class FetchfavouriteUseCase {
  final NewsRepository _newsRepository;

  FetchfavouriteUseCase(this._newsRepository);

  List<News> call() {
   return _newsRepository.fetchAllFavourites();
  }
}
