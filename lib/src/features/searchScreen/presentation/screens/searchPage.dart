import 'package:flutter/material.dart';
import 'package:newsapp/src/features/home/data/topHeadLineModel.dart';
import 'package:newsapp/src/features/home/presentation/widget/HomePageForm.dart';
import 'package:newsapp/src/features/searchScreen/services/SearchPageServices.dart';
import 'package:newsapp/src/imports/core_imports.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key, required this.search});
  final String search;

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  AppStatus status = AppStatus.initial;

  TopHeadlines? searchResult;

  Future<void> getResultData() async {
    setState(() {
      status = AppStatus.loading;
    });

    final result = await SearchPageServices().getsearchResults(
      query: widget.search,
    );

    result.fold((failure) {
      setState(() {
        status = AppStatus.failure;
        this.failure = failure;
      });
    }, (success) {
      setState(
        () {
          status = AppStatus.success;
          searchResult = success;
        },
      );
    });
  }

  Failure? failure;
  @override
  void initState() {
    getResultData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Search result',
        isTransparent: true,
      ),
      body: switch (status) {
        AppStatus.initial || AppStatus.loading => SessionListenerWrapper(
            child: SkeletonWrapper(
              isLoading: status == AppStatus.loading,
              enabled: true,
              child: HomePageForm(
                topHeadlines: searchResult ?? TopHeadlines.fake(),
                isSearch: true,
              ),
            ),
          ),
        AppStatus.success => SafeArea(
                  child: (searchResult == null)
                      ? const AppErrorWidget()
                      : (searchResult!.articles!.isEmpty)
                          ? const AppEmptyState(
                              title: 'No News found',
                            )
                          : HomePageForm(
                              topHeadlines: searchResult,
                              isSearch: true,
                            ))
              .paddingSymmetric(
            vertical: context.designTokens.paddingMedium,
          ),
        AppStatus.failure => const AppErrorWidget(),
      },
    );
  }
}
