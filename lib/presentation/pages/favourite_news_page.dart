import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/cubit/news_cubit.dart';
import 'package:news_app/presentation/widgets/news_list_item.dart';

class FavouriteNewsPage extends StatelessWidget {
  const FavouriteNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favs = context.watch<NewsCubit>().favouriteNews;
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        itemCount: favs.length,
        itemBuilder: (context, index) => NewsListItem(news: favs[index]),
      )),
    );
  }
}
