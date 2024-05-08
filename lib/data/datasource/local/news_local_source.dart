import 'package:hive/hive.dart';
import 'package:news_app/data/models/news_model.dart';

abstract class NewsLocalSource {
  void insertNews({required List<NewsModel> news});
  List<NewsModel> fetchAllNews();
  void addToFavourite(NewsModel news);
  List<NewsModel> fetchAllFavourites();
}

class NewsLocalSourceImpl implements NewsLocalSource {
  NewsLocalSourceImpl();
  @override
  List<NewsModel> fetchAllNews() {
    final box = Hive.box(name: "local");
    final List<NewsModel> newsList = [];
    box.read(() {
      for (int i = 0; i < box.length; i++) {
        newsList.add(NewsModel.fromJson(box.get(i.toString())));
      }
    });
    return newsList;
  }

  @override
  void insertNews({required List<NewsModel> news}) {
    final box = Hive.box(name: "local");
    box.clear();
    box.write(() {
      for (int i = 0; i < news.length; i++) {
        box.put(i.toString(), news[i].toJson());
      }
    });
  }

  @override
  void addToFavourite(NewsModel news) {
    final box = Hive.box(name: "Favourites");
    box.put(box.length.toString(), news.toJson());
  }

  @override
  List<NewsModel> fetchAllFavourites() {
    final box = Hive.box(name: "Favourites");
    final List<NewsModel> newsList = [];
    box.read(() {
      for (int i = 0; i < box.length; i++) {
        newsList.add(NewsModel.fromJson(box.get(i.toString())));
      }
    });
    return newsList;
  }
}
