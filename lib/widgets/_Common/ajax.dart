import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;

class Ajax {
  static post(String url, Map<String, dynamic> body) async {
    final uri = Uri.parse(url);
    final headers = {'Content-Type': 'charset=UTF-8'};

    http.Response response = await http.post(
      uri,
      // headers: headers,
      headers: {},
      body: body,
      // encoding: encoding,
    );

    if (response.statusCode == 200) {
      print('${response.body}');
    } else {
      throw Exception('Failed to load data!');
    }
  }

  static get(url) async {
    final uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    int statusCode = response.statusCode;
    print(statusCode);
    String responseBody = response.body;
    print(responseBody);
  }
}
