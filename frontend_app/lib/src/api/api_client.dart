import 'package:frontend_app/src/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiClient{
  static Future<http.Response> getApi(String path) async{
    var response = await http.get(Uri.parse(baseUrl + path));
    return response;
  }
}