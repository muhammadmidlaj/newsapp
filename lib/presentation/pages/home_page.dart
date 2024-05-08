import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/cubit/news_cubit.dart';
import 'package:news_app/presentation/widgets/news_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<NewsCubit>().fetchAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          log(state.toString());
          if (state is NewsInitial) {
            context.read<NewsCubit>().fetchAllNews();
          }
          if (state is NewsErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.failure.message)));
          }
        },
        builder: (context, state) {
          if (state is NewsLoadedState) {
            return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return NewsListItem(
                  news: state.news[index],
                );
              },
            );
          }
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const Center(
            child: Text("Error"),
          );
        },
      ),
    );
  }
}
