import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/constants/gap_constants.dart';
import 'package:news_app/core/utils/extentions.dart';
import 'package:news_app/presentation/pages/favourite_news_page.dart';
import 'package:news_app/presentation/pages/home_page.dart';
import 'package:news_app/presentation/widgets/tab.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  List<Widget> pages = const [HomePage(), FavouriteNewsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTab(
                  title: "News",
                  selected: _selectedIndex == 0,
                  icon: const Icon(Icons.menu),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                CustomTab(
                    title: "Favs",
                    selected: _selectedIndex == 1,
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    })
              ],
            ),
          ),
          Expanded(child: pages[_selectedIndex])
        ]),
      ),
    );
  }
}
