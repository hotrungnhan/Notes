import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';

@immutable
class HttpException implements Exception {
  final int statusCode;
  final dynamic error;
  const HttpException({required this.statusCode, required this.error});
  @override
  String toString() {
    return "HttpException{statusCode:$statusCode,error:${error.toString()}";
  }
}

class ThrowErrorResponseInterceptor extends ResponseInterceptor {
  @override
  FutureOr<Response> onResponse(Response response) {
    if (response.error != null) {
      throw HttpException(
          statusCode: response.statusCode, error: response.error);
    }
    return response;
  }
}
