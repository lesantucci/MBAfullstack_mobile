import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHandler {
    static Future<http.Response> post(String url,  Map<String, dynamic> body) {
      return http.post(Uri.parse(url), headers: <String, String>{'Content-Type': 'application/json'}, body: jsonEncode(body));
    }

    static Future<http.Response> get(String url) {
      return http.get(Uri.parse(url), headers: <String, String>{'Content-Type': 'application/json'});
    }
}