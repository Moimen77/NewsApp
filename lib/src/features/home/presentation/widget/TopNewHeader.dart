// ignore_for_file: file_names

import 'package:newsapp/src/features/home/data/topHeadLineModel.dart';
import 'package:newsapp/src/imports/core_imports.dart';

class TopNewHeader extends StatelessWidget {
  const TopNewHeader({super.key, required this.topHeadlines});
  final TopHeadlines topHeadlines;

  @override
  Widget build(BuildContext context) {
    final TopNews = topHeadlines.articles?.firstOrNull;
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(context.designTokens.borderRadiusMedium),
          child: TopNews?.urlToImage != null
              ? AppCachedImage(
                  imageUrl: TopNews!.urlToImage!,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/images/120776.webp',
                  fit: BoxFit.cover,
                ),
        ),
        8.kH,
        Text(TopNews?.title ?? '', style: theme.textTheme.titleMedium),
        4.kH,
        Text(
            '${TopNews?.author ?? 'N/A'}  ${TopNews!.publishedAt?.toLocal().timeAgo() ?? 'N/A'}',
            style: theme.textTheme.bodySmall
                ?.copyWith(color: colorScheme.onSurfaceVariant)),
      ],
    );
  }
}
