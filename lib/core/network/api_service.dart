import 'dart:convert';
import 'dart:io';

import 'package:e_zone/core/res/helper/helper_method.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var noInternetMessage = "Please check your connection!";

  static getRequest({required String url}) async {
    if (!await checkInternet) {
      throw noInternetMessage;
    }
    http.Response response = await http.get(
      Uri.parse(url),
    );
    return response;
  }

  static postRequest({required String url, required Map<String,dynamic> body}) async {
    if (!await checkInternet) {
      throw noInternetMessage;
    }
    var headers = {'Content-Type': 'application/json'};

    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: headers,
    );
    return response;
  }



  static handleResponse(http.Response response) async {
    try {
      if (!await checkInternet) {
        throw noInternetMessage;
      }

      if (response.statusCode >= 200 && response.statusCode <= 210) {
        kPrint("SuccessCode : ${response.statusCode}");
        kPrint("SuccessBody : ${response.body}");

        if (response.body.isNotEmpty) {
          return jsonDecode(response.body);
        } else {
          return response.body;
        }
      } else if (response.statusCode == 401) {
        String msg = "Unauthorized";

        if (response.body.isNotEmpty) {
          if (jsonDecode(response.body)['error'] != null) {
            msg = jsonDecode(response.body)['error'];
          }
        }

        throw msg;
      } else if (response.statusCode == 404) {
        throw "Page Not Found!";
      } else if (response.statusCode == 500) {
        throw "Server Error";
      } else {
        kPrint("Error Code : ${response.statusCode}");
        kPrint("Error Response : ${response.body}");

        String msg = "Something went wrong";

        throw msg;
      }
    } on SocketException catch (_) {
      throw noInternetMessage;
    } on FormatException catch (_) {
      throw "Bad Response Format";
    } catch (e) {
      kPrint(e.toString());
      throw e.toString();
    }
  }
}
