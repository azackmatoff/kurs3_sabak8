import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpUtils {
  static Future<dynamic> get(String url) async {
    final _uri = Uri.parse(url);

    final http.Response response = await http.get(_uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final _data = json.decode(response.body) as Map<String, dynamic>;
      return _data;
    } else {
      return null;
    }
  }

  static Future<dynamic> put(String url) async {
    final _uri = Uri.parse(url);

    final http.Response response = await http.put(_uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final _data = json.decode(response.body) as Map<String, dynamic>;
      return _data;
    } else {
      return null;
    }
  }

  static Future<dynamic> delete(String url) async {
    final _uri = Uri.parse(url);

    final http.Response response = await http.delete(_uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final _data = json.decode(response.body) as Map<String, dynamic>;
      return _data;
    } else {
      return null;
    }
  }
}
