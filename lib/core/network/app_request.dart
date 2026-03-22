import 'dart:io';

import 'package:http/http.dart';

abstract interface class IAppRequest {
  Future<Response> get({
    String? endPoint,
    Map<String, dynamic> requestBody = const {},
    Map<String, String> header = const {},
  });
  Future<Response> post({
    String? endPoint,
    Map<String, dynamic>? requestBody,
    Map<String, String> header = const {},
  });
  Future<Response> delete({
    String? endPoint,
    Map<String, String> header = const {},
  });
  Future<Response> put({
    String? endPoint,
    Map<String, dynamic>? requestBody,
    Map<String, String> header = const {},
  });
  Future<Response> patch({
    String? endPoint,
    Map<String, dynamic>? requestBody,
    Map<String, String> header = const {},
  });
  Future<Response> muiltipartPost({
    String? endPoint,
    Map<String, File>? fileRequestBody,
    Map<String, dynamic>? otherDetailsRequestBody,
  });
  Future<Response> muiltipartPut({
    String? endPoint,
    Map<String, dynamic>? fileRequestBody,
    Map<String, dynamic>? otherDetailsRequestBody,
  });
}
