import 'package:newsapp/generated/locale_keys.g.dart';
import 'package:newsapp/src/features/home/presentation/widget/ListCategoryFilters.dart';
import 'package:newsapp/src/features/home/presentation/widget/NewCard.dart';
import 'package:newsapp/src/features/home/presentation/widget/TopNewHeader.dart';
import 'package:newsapp/src/imports/core_imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppTopBar(
          title: LocaleKeys.home_home_title.tr(),
          isHome: true,
          actions: [
            IconButton(
              onPressed: () {
                // For template purpose:
              },
              icon: Icon(
                Icons.search,
                color: colorScheme.onPrimary,
              ),
            ),
          ],
          centerTitle: false,
        ),
        body: SafeArea(
            child: Column(
          children: [
            16.kH,
            const ListCategoryFilters(),
            24.kH,
            Column(
              children: [
                const TopNewHeader(),
                24.kH,
                ListView(
                  children: [
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                  ].separatedBy(24.kH),
                ).expanded
              ],
            )
                .paddingSymmetric(horizontal: context.designTokens.paddingLarge)
                .expanded,
          ],
        )));
  }
}
