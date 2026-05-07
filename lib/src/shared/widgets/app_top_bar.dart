import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../imports/core_imports.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    required this.title,
    this.titleWidget,
    this.actions,
    this.centerTitle = true,
    this.onPressed,
    this.isTransparent = false,
    this.isHome = false,
  });

  final String title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final VoidCallback? onPressed;
  final bool? centerTitle;
  final bool isTransparent;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    // Check if we can pop
    final bool canPop = context.canPop();

    void handleBack() {
      if (onPressed != null) {
        onPressed!();
      } else if (canPop) {
        context.pop();
      } else {
        context.go(AppRoutes.home);
      }
    }

    return AppBar(
      centerTitle: centerTitle,
      toolbarHeight: isHome ? 100.h : kToolbarHeight,
      backgroundColor:
          isTransparent ? Colors.transparent : theme.colorScheme.primary,
      shadowColor: Colors.transparent,
      title: titleWidget ??
          Text(
            title,
            style: isHome
                ? theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onPrimary,
                  )
                : null,
          ),
      leadingWidth: 40.w,
      leading: !canPop
          ? null
          : GestureDetector(
              onTap: handleBack,
              child: ColoredBox(
                color: Colors.transparent,
                child: Icon(
                  Icons.arrow_back,
                  color: theme.appBarTheme.iconTheme?.color ??
                      theme.colorScheme.onPrimary,
                ),
              ),
            ),
      iconTheme: theme.appBarTheme.iconTheme,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(isHome ? 100.h : kToolbarHeight);
}
