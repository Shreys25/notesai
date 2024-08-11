import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static final String apiKey = dotenv.env['API_KEY'] ?? 'default_key';
}
