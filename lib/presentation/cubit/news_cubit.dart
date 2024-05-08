import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/core/error/failure.dart';

import 'package:news_app/domain/entity/news.dart';
import 'package:news_app/domain/usecase/add_too_favourite_usecase.dart';
import 'package:news_app/domain/usecase/fetch_favourite_usecase.dart';
import 'package:news_app/domain/usecase/fetch_news_usecase.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final FetchNewsUseCase _fetchNewsUseCase;
  final AddToFavouriteUseCase _addToFavouriteUseCase;
  final FetchfavouriteUseCase _fetchfavouriteUseCase;
  NewsCubit(this._fetchNewsUseCase, this._addToFavouriteUseCase,
      this._fetchfavouriteUseCase)
      : super(NewsInitial());

  List<News> favouriteNews = [];
  Future<void> fetchAllNews() async {
    emit(NewsLoadingState());

    final response = await _fetchNewsUseCase.call();
    response.fold((l) => emit(NewsErrorState(failure: l)),
        (r) => emit(NewsLoadedState(news: r)));
  }

  void addToFavourite(News news) {
    _addToFavouriteUseCase.call(news);
    fetchFavourites();
  }

  void fetchFavourites() {
    final response = _fetchfavouriteUseCase.call();
    favouriteNews.clear();
    favouriteNews.addAll(response);
  }
}
