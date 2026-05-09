import 'package:flutter/material.dart';
import 'package:newsapp/src/extensions/extensions.dart';
import 'package:newsapp/src/features/home/data/ArticlesModel.dart';
import 'package:newsapp/src/imports/core_imports.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});
  final Articles news;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(news.title ?? 'No-Title',
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: theme.textTheme.titleMedium),
              4.kH,
              Text(
                  '${news.author ?? 'No-Author'} . ${news.publishedAt?.timeAgo() ?? 'N/A'}',
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: colorScheme.onSurfaceVariant)),
            ],
          ),
        ),
        ClipRRect(
          borderRadius:
              BorderRadius.circular(context.designTokens.borderRadiusMedium),
          child: news.urlToImage != null
              ? AppCachedImage(
                  imageUrl: news.urlToImage!,
                )
              : Image.asset(
                  'assets/images/120776.webp',
                  fit: BoxFit.cover,
                ),
        ).expanded
      ],
    );
  }
}
