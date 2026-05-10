import 'package:flutter/material.dart';
import 'package:newsapp/src/extensions/extensions.dart';
import 'package:newsapp/src/features/home/data/topHeadLineModel.dart';
import 'package:newsapp/src/features/home/presentation/widget/ListCategoryFilters.dart';
import 'package:newsapp/src/features/home/presentation/widget/NewCard.dart';
import 'package:newsapp/src/features/home/presentation/widget/TopNewHeader.dart';

class HomePageForm extends StatelessWidget {
  const HomePageForm(
      {super.key, required this.topHeadlines, this.isSearch = false});
  final TopHeadlines? topHeadlines;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isSearch)
          const SizedBox()
        else
          Column(
            children: [
              16.kH,
              const ListCategoryFilters(),
              24.kH,
              TopNewHeader(
                topHeadlines: topHeadlines!,
              ),
              12.kH,
            ],
          ),
        ListView.builder(
          itemBuilder: (context, index) {
            if (index == 0) return const SizedBox();

            return NewsCard(
              news: topHeadlines!.articles![index],
            ).paddingOnly(bottom: 24);
          },
          itemCount: topHeadlines?.articles?.length ?? 0,
        ).expanded,
      ],
    ).paddingSymmetric(
      horizontal: context.designTokens.paddingLarge,
    );
  }
}
