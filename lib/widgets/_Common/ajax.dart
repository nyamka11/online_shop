import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Ajax {
  static post(String url, Map<String, dynamic> body) async {
    try {
      String apiHost = dotenv.get("API_HOST", fallback: "");

      final urlParsed = Uri.parse(apiHost + url);
      final headers = {'Content-Type': 'charset=UTF-8'};
      http.Response response = await http.post(urlParsed,
          // headers: headers,
          headers: {},
          body: body
          // encoding: encoding,
          );

      Map map = jsonDecode(response.body);
      return map;
    } on Exception catch (_) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('AlertDialog description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => {},
            child: Text("asdfasf"),
          ),
          TextButton(
            onPressed: () => {},
            child: Text('OK'),
          ),
        ],
      );

      print("throwing new error");
      throw Exception("Error on server");
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
