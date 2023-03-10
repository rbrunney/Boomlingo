import 'package:http/http.dart';
import 'dart:convert';

class Requests {

  Future<String> makeGetRequest(String url) async {
    final requestLink = Uri.parse(url);
    Response response = await get(requestLink);

    return response.body;
  }

  Future<String> makePostRequest(
      String url, Map<String, dynamic> requestBody) async {
    final requestLink = Uri.parse(url);
    final headers = {
      "Content-type": "application/json",
      'Accept': 'application/json'
    };
    Response response = await post(requestLink,
        headers: headers, body: json.encode(requestBody));

    return response.body;
  }

  Future<String> makeDeleteRequest(
      String url, Map<String, dynamic> requestBody) async {
    final requestLink = Uri.parse(url);
    final headers = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };
    Response response = await delete(requestLink,
        headers: headers, body: json.encode(requestBody));

    return response.body;
  }

  Future<String> makePutRequest(
      String url, Map<String, dynamic> requestBody) async {
    final requestLink = Uri.parse(url);
    final headers = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };
    Response response = await put(requestLink,
        headers: headers, body: json.encode(requestBody));

    return response.body;
  }
}