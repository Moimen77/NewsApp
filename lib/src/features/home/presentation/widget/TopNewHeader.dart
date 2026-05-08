import 'package:flutter/material.dart';
import 'package:newsapp/src/extensions/extensions.dart';

class TopNewHeader extends StatelessWidget {
  const TopNewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(context.designTokens.borderRadiusMedium),
          child: Image.asset(
            'assets/images/120776.webp',
            fit: BoxFit.cover,
          ),
        ),
        8.kH,
        Text('Apple Unveils Revolutionary AI Features',
            style: theme.textTheme.titleMedium),
        4.kH,
        Text('Moimen Adel . May 20, 2024',
            style: theme.textTheme.bodySmall
                ?.copyWith(color: colorScheme.onSurfaceVariant)),
      ],
    );
  }
}
