import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/constants/gap_constants.dart';
import 'package:news_app/core/utils/extentions.dart';

class CustomTab extends StatelessWidget {
  const CustomTab(
      {super.key,
      required this.title,
      required this.selected,
      required this.icon,
      required this.onTap});
  final String title;
  final bool selected;
  final Widget icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          alignment: Alignment.center,
          color: selected ? Colors.blueGrey.shade100 : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              GapConstant.w8,
              Text(
                title,
                style: context.theme.textTheme.titleLarge,
              ),
            ],
          )),
    );
  }
}
