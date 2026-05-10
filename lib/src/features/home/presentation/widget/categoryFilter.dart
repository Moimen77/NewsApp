import 'package:newsapp/src/imports/imports.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(AppRoutes.search, extra: title);
      },
      child: Container(
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
      ),
    );
  }
}
