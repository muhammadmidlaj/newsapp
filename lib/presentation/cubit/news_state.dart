part of 'news_cubit.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoadingState extends NewsState {}

final class NewsErrorState extends NewsState {
  final Failure failure;

  const NewsErrorState({required this.failure});
}

final class NewsLoadedState extends NewsState {
  final List<News> news;

  const NewsLoadedState({required this.news});
}
