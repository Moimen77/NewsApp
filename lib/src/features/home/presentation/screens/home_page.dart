import 'package:newsapp/generated/locale_keys.g.dart';
import 'package:newsapp/src/features/home/data/topHeadLineModel.dart';
import 'package:newsapp/src/features/home/presentation/widget/ListCategoryFilters.dart';
import 'package:newsapp/src/features/home/presentation/widget/NewCard.dart';
import 'package:newsapp/src/features/home/presentation/widget/TopNewHeader.dart';
import 'package:newsapp/src/features/home/services/HomePageservices.dart';
import 'package:newsapp/src/imports/core_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getTopHeadlines();
    super.initState();
  }

  AppStatus status = AppStatus.initial;

  TopHeadlines? topHeadlines;

  Failure? failure;

  //getTopHeadlines
  Future<void> getTopHeadlines() async {
    setState(() {
      status = AppStatus.loading;
    });

    final result = await Homepageservices().getTopHeadlines();
    result.fold((failure) {
      setState(() {
        status = AppStatus.failure;
        this.failure = failure;
      });
    }, (success) {
      setState(
        () {
          status = AppStatus.success;
          topHeadlines = success;
        },
      );
    });
  }

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
        body: switch (status) {
          AppStatus.initial || AppStatus.loading => const AppLoading(),
          AppStatus.success => SafeArea(
              child: (topHeadlines == null)
                  ? const AppErrorWidget()
                  : (topHeadlines!.articles!.isEmpty)
                      ? const AppEmptyState(
                          title: 'No News found',
                        )
                      : Column(
                          children: [
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
                        ),
            ),
          AppStatus.failure => const AppErrorWidget(),
        });
  }
}
