import 'package:flutter/material.dart';
import 'package:newsapp/src/extensions/context_extension.dart';
import 'package:newsapp/src/extensions/extensions.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

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
              Text('Apple Unveils Revolutionary AI Features',
                  style: theme.textTheme.titleMedium),
              4.kH,
              Text('Moimen Adel . May 20, 2024',
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: colorScheme.onSurfaceVariant)),
            ],
          ),
        ),
        ClipRRect(
          borderRadius:
              BorderRadius.circular(context.designTokens.borderRadiusMedium),
          child: Image.asset(
            'assets/images/120776.webp',
            fit: BoxFit.cover,
          ),
        ).expanded
      ],
    );
  }
}
