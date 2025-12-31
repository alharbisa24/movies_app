
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SharedPrefKeys {
  static String apiToken = "${dotenv.env['API_TOKEN']}";
}