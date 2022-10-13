import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'loader.dart';

class HTTPHelper {
  String apiHost = dotenv.get("API_HOST", fallback: "");
  // final headers = {'content-Type': 'charset=UTF-8'};

  // final headers = {'Content-type': 'application/json'};
  final headers = null;

  //--Fetching all items
  Future<List<Map>> fetchItems(String url) async {
    List<Map> items = [];

    //--Get the data from the API
    http.Response response = await http.get(Uri.parse(apiHost + url));

    if (response.statusCode == 200) {
      //get the data from the response
      String jsonString = response.body;
      //Convert to List<Map>
      List data = jsonDecode(jsonString);
      items = data.cast<Map>();
    }

    return items;
  }

  //--Fetch details of one item
  Future<Map> getItem(itemId, url) async {
    Map item = {};
    //Get the item from the API
    http.Response response = await http.get(Uri.parse(apiHost + url));

    if (response.statusCode == 200) {
      //get the data from the response
      String jsonString = response.body;
      //Convert to List<Map>
      item = jsonDecode(jsonString);
    }
    return item;
  }

  //-- Add a new item
  Future<Map> addItem(BuildContext ctx, String url, Map data) async {
    final urlParsed = Uri.parse(apiHost + url);
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (_) {
        return requestLoader();
      },
    );

    http.Response response = await http.post(
      urlParsed,
      headers: headers,
      body: data,
    );

    return Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.of(ctx).pop();
      print(response.body);
      return jsonDecode(response.body) as Map;
    });
  }

//-- Update an item
  Future<bool> updateItem(String url, Map data, String itemId) async {
    bool status = false;

    //Update the item, call the API
    http.Response response = await http.put(Uri.parse(apiHost + url),
        body: jsonEncode(data), headers: headers);

    if (response.statusCode == 200) {
      status = response.body.isNotEmpty;
    }

    return status;
  }

  //--Delete an item
  Future<bool> deleteItem(String url, String itemId) async {
    bool status = false;

    //Delete the item from the Database
    http.Response response = await http.delete(
      Uri.parse(apiHost + url),
    );

    if (response.statusCode == 200) {
      status = true;
    }

    return status;
  }
}
