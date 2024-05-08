import 'package:flutter/material.dart';
import 'package:news_app/core/constants/gap_constants.dart';
import 'package:news_app/core/utils/date_helper.dart';
import 'package:news_app/core/utils/extentions.dart';
import 'package:news_app/domain/entity/news.dart';

class NewsViewPage extends StatelessWidget {
  const NewsViewPage({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Back"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.keyboard_arrow_left)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  news.urlToImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GapConstant.h12,
            Text(
              news.title,
              style: context.theme.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            GapConstant.h8,
            Row(
              children: [
                const Icon(Icons.calendar_month_outlined),
                GapConstant.w8,
                Text(
                  "${convertDate(DateConvertionType.wDdayMonthYear, news.publishedAt)}  ${TimeOfDay.fromDateTime(news.publishedAt).format(context)}",
                )
              ],
            ),
            GapConstant.h12,
            Text(news.content.split("[").first)
          ],
        ),
      ),
    );
  }
}
