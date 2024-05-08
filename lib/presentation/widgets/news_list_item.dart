import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news_app/core/utils/date_helper.dart';
import 'package:news_app/domain/entity/news.dart';
import 'package:news_app/presentation/cubit/news_cubit.dart';
import 'package:news_app/presentation/pages/news_view_page.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      direction: Axis.horizontal,
      endActionPane:
          ActionPane(extentRatio: 0.3, motion: const DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) => _addToFavourite(context),
          backgroundColor: Colors.red.shade100,
          icon: Icons.favorite,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          label: "Add to Favourite",
        )
      ]),
      child: InkWell(
        onTap: () => _navigateToNewDetailsPage(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 1),
                    blurRadius: 8,
                    spreadRadius: 3,
                    color: Colors.grey.shade300)
              ]),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    news.urlToImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .75,
                      child: Text(
                        news.title,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .75,
                      child: Text(
                        news.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined),
                        Text(
                          "${convertDate(DateConvertionType.wDdayMonthYear, news.publishedAt)}  ${TimeOfDay.fromDateTime(news.publishedAt).format(context)}",
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _navigateToNewDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NewsViewPage(news: news),
    ));
  }

  _addToFavourite(BuildContext context) {
    context.read<NewsCubit>().addToFavourite(news);
  }
}
