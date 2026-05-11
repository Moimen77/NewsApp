import 'package:newsapp/src/features/home/data/ArticlesModel.dart';

class TopHeadlines {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  TopHeadlines({this.status, this.totalResults, this.articles});

  TopHeadlines.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  /// Fake data for skeleton loading
  static TopHeadlines fake() {
    return TopHeadlines(
      status: 'ok',
      totalResults: 8,
      articles: List.generate(
        12,
        (index) => Articles.fake(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
