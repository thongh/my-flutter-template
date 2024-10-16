import 'package:validators/sanitizers.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // ignore: constant_identifier_names
  static const DECKOFCARDBASEURL = 'https://deckofcardsapi.com/api';
  static const baseUrl = DECKOFCARDBASEURL;

  Uri _url(String path, [Map<String, dynamic> params = const {}]) {
    String queryString = "";
    if (params.isNotEmpty) {
      queryString = "?";
      params.forEach(
        (k, v) {
          queryString += "$k=${v.toString()}&";
        },
      );
    }
    path = rtrim(path, '/');
    path = ltrim(path, '/');
    queryString = rtrim(queryString, '&');

    final url = '$baseUrl/$path/$queryString';
    return Uri.parse(url);
  }

  Future<http.Response> httpGet(String path, {Map<String, dynamic> params = const {}}) async {
    final url = _url(path, params);
    final response = await http.get(url);
    return response;
  }

}
