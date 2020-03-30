import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const PAGE_SIZE_QUERY_PARAM_KEY = 'pageSize';
const PAGE_QUERY_PARAM_KEY = 'page';

class HttpRepository {
  HttpRepository(this.baseUrl) : httpClient = http.Client();

  final String baseUrl;
  final http.Client httpClient;

  @protected
  Future<List<dynamic>> getAll(
    String path, {
    int pageSize = 10,
    int page = 1,
    Map<String, String> headers,
    Map<String, dynamic> queryParameters,
    bool isJsonResponse = true,
  }) {
    queryParameters = queryParameters ?? {};
    queryParameters[PAGE_SIZE_QUERY_PARAM_KEY] = pageSize;
    queryParameters[PAGE_QUERY_PARAM_KEY] = page;

    return get(path, queryParameters: queryParameters, headers: headers);
  }

  @protected
  Future<dynamic> get(
    String path, {
    Map<String, String> headers,
    Map<String, dynamic> queryParameters,
    bool isJsonResponse = true,
  }) async {
    http.Response response = await httpClient.get(
      _generateUrl(path, queryParameters: queryParameters),
      headers: headers,
    );

    return isJsonResponse ? jsonEncode(response.body) : response.body;
  }

  @protected
  Future<dynamic> post(
    String path,
    dynamic body, {
    Map<String, String> headers,
    Map<String, dynamic> queryParameters,
    bool isJsonResponse = true,
  }) async {
    http.Response response = await httpClient.post(
      _generateUrl(path, queryParameters: queryParameters),
      body: body,
      headers: headers,
    );

    return isJsonResponse ? jsonEncode(response.body) : response.body;
  }

  @protected
  Future<dynamic> put(
    String path,
    dynamic body, {
    Map<String, String> headers,
    Map<String, dynamic> queryParameters,
    bool isJsonResponse = true,
  }) async {
    http.Response response = await httpClient.put(
      _generateUrl(path, queryParameters: queryParameters),
      body: body,
      headers: headers,
    );

    return isJsonResponse ? jsonEncode(response.body) : response.body;
  }

  @protected
  Future<void> delete(
    String path, {
    Map<String, dynamic> queryParameters,
    Map<String, String> headers,
  }) async {
    await httpClient.delete(
      _generateUrl(path, queryParameters: queryParameters),
      headers: headers,
    );

    return;
  }

  String _generateUrl(
    String path, {
    Map<String, dynamic> queryParameters,
  }) {
    String url = "$baseUrl$path";

    if (queryParameters == null) {
      return url;
    }

    queryParameters.removeWhere((_, dynamic value) => value == null);

    if (queryParameters.entries.isNotEmpty) {
      String queryString = queryParameters.entries
          .map(
            (MapEntry<String, dynamic> entry) => "${entry.key}=${entry.value}",
          )
          .join('&');

      return "$url?$queryString";
    }

    return url;
  }
}
