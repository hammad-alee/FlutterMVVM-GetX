import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_getx/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getApiResponse(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 60));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connetion.");
    }
    return jsonResponse;
  }

  @override
  Future postApiResponse(String url, data) async {
    dynamic jsonResponse;
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 60));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connetion.");
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        {
          return jsonDecode(response.body);
        }
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorizedException(response.body.toString());

      default:
        throw FetchDataException(
            'Error occured while communicating with status Code ${response.statusCode}');
    }
  }
}
