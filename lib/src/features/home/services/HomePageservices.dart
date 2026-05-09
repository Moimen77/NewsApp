import 'package:fpdart/fpdart.dart';
import 'package:newsapp/src/features/home/data/topHeadLineModel.dart';
import 'package:newsapp/src/imports/constants.dart';
import 'package:newsapp/src/imports/core_imports.dart';

class Homepageservices {
  FutureEither<TopHeadlines> getTopHeadlines({
    String country = 'us',
  }) async {
    final result = await DioService.instance.get(
      '${AppConfig.baseUrl}top-headlines',
      queryParameters: {
        'country': country,
        'apiKey': ApiConstants.apiKey,
      },
    );
    return result.fold(
      (failure) => left(failure),
      (response) {
        final model = TopHeadlines.fromJson(response.data);

        return right(model);
      },
    );
  }
}
