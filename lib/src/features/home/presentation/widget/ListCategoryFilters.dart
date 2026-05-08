import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/src/extensions/context_extension.dart';
import 'package:newsapp/src/extensions/extensions.dart';
import 'package:newsapp/src/features/home/data/categoryFilterList.dart';
import 'package:newsapp/src/features/home/presentation/widget/categoryFilter.dart';

class ListCategoryFilters extends StatelessWidget {
  const ListCategoryFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.directional(
        start: context.designTokens.paddingMedium,
      ),
      child: SizedBox(
        height: 32.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: categories
              .map((category) => CategoryFilter(title: category))
              .toList()
              .separatedBy(12.kW),
        ),
      ),
    );
  }
}
