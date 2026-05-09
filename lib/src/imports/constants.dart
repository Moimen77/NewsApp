import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  ApiConstants._();
  static const String baseUrl = 'https://newsapi.org/v2/';
  static final String apiKey = dotenv.get('API_KEY');
}
