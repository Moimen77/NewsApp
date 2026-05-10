import 'package:newsapp/generated/locale_keys.g.dart';
import 'package:newsapp/src/features/home/data/topHeadLineModel.dart';
import 'package:newsapp/src/features/home/presentation/widget/HomePageForm.dart';
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
          AppStatus.initial || AppStatus.loading => SessionListenerWrapper(
              child: SkeletonWrapper(
                isLoading: status == AppStatus.loading,
                enabled: true,
                child: HomePageForm(
                  topHeadlines: topHeadlines ?? TopHeadlines.fake(),
                ),
              ),
            ),
          AppStatus.success => SafeArea(
              child: (topHeadlines == null)
                  ? const AppErrorWidget()
                  : (topHeadlines!.articles!.isEmpty)
                      ? const AppEmptyState(
                          title: 'No News found',
                        )
                      : HomePageForm(
                          topHeadlines: topHeadlines,
                        )),
          AppStatus.failure => const AppErrorWidget(),
        });
  }
}
