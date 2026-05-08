import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/src/shared/shared.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: 56.radius,
        border: Border.all(
          color: context.theme.colorScheme.inversePrimary,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: context.theme.textTheme.bodyMedium?.copyWith(
            color: context.theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
