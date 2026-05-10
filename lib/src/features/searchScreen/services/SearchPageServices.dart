import 'package:fpdart/fpdart.dart';
import 'package:newsapp/src/features/home/data/topHeadLineModel.dart';
import 'package:newsapp/src/imports/constants.dart';
import 'package:newsapp/src/imports/core_imports.dart';

class SearchPageServices {
  FutureEither<TopHeadlines> getsearchResults({
    required String query,
  }) async {
    final result = await DioService.instance.get(
      '${AppConfig.baseUrl}everything',
      queryParameters: {
        'q': query,
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
