import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/core/network/network.dart';
import 'package:news_app/data/datasource/local/news_local_source.dart';
import 'package:news_app/data/datasource/remote/news_remote_source.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/data/repository_impl/news_repository_impl.dart';
import 'package:news_app/domain/entity/news.dart';
import 'package:news_app/domain/repository/news_repository.dart';
import 'package:news_app/domain/usecase/add_too_favourite_usecase.dart';
import 'package:news_app/domain/usecase/fetch_favourite_usecase.dart';
import 'package:news_app/domain/usecase/fetch_news_usecase.dart';
import 'package:news_app/presentation/cubit/news_cubit.dart';
import 'package:path_provider/path_provider.dart';

final locator = GetIt.instance;
Future<void> init() async {
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  locator.registerFactory<Box<News>>(() => Hive.box<News>(name: "local"));

  locator.registerFactory(() => InternetConnection());
  locator.registerFactory<ConnectionChecker>(
      () => ConnectionCheckerImpl(locator()));
  locator.registerLazySingleton(() => http.Client());
  _cubits();
  _dataSource();
  _repository();
  _useCase();
}

void _cubits() {
  locator.registerFactory(() => NewsCubit(locator(),locator(),locator()));
}

void _useCase() {
  locator.registerLazySingleton(() => FetchNewsUseCase(locator()));
  locator.registerLazySingleton(() => AddToFavouriteUseCase(locator()));
  locator.registerLazySingleton(() => FetchfavouriteUseCase(locator()));
}

void _repository() {
  locator.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(locator(), locator(), locator()));
}

void _dataSource() {
  locator.registerLazySingleton<NewsRemoteSource>(
      () => NewsRemoteSourceImpl(locator()));
  locator.registerLazySingleton<NewsLocalSource>(() => NewsLocalSourceImpl());
}
