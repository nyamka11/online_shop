import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'navigator_global.dart';

class HTTPHelper {
  String apiHost = dotenv.get("API_HOST", fallback: "");

  // final headers = {'Content-type': 'application/json'};
  final headers = null;

  //--Fetching all items
  Future<List<Map>> fetchItems(String url) async {
    try {
      List<Map> items = [];
      //--Get the data from the API
      http.Response response;
      try {
        // GlobaAlertDialog.showLoadingDialog();
        response = await http.get(Uri.parse(apiHost + url));

        if (response.statusCode == 200) {
          String jsonString = response.body;
          List data = jsonDecode(jsonString);
          items = data.cast<Map>();
        }

        // return await Future.delayed(const Duration(seconds: 1), () {
        //   GlobaAlertDialog.pop();
        //   return items;
        // });

        return items;
      } catch (e) {
        return errorExceptionDialog(true) as List<Map>;
      }
    } on TimeoutException catch (e) {
      return errorExceptionDialog(true) as List<Map>;
    }
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

  //-- post
  Future<Map> post(
    String url,
    Map data, {
    bool systemErrorDioagShow = true,
  }) async {
    try {
      GlobaAlertDialog.showLoadingDialog();

      final urlParsed = Uri.parse(apiHost + url);
      http.Response response;
      try {
        response = await http
            .post(
              urlParsed,
              headers: headers,
              body: data,
            )
            .timeout(const Duration(seconds: 30));
      } catch (e) {
        print(e);
        return errorExceptionDialog(systemErrorDioagShow);
      }

      return await Future.delayed(const Duration(seconds: 1), () {
        GlobaAlertDialog.pop();
        return jsonDecode(response.body) as Map;
      });
    } on TimeoutException catch (_) {
      return errorExceptionDialog(systemErrorDioagShow);
    }
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

Map errorExceptionDialog(errorDioagShow) {
  GlobaAlertDialog.pop();

  if (errorDioagShow) {
    GlobaAlertDialog.showErrorDialog();
  }

  return {
    "success": false,
    "message": "システムエラー",
  };
}
