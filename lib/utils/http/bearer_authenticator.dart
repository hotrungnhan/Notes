import 'dart:async';

import 'package:chopper/chopper.dart';

class BearerAuthenticator implements Authenticator {
  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) {
    const token = "";
    // ignore: unnecessary_null_comparison
    if (token != null) {
      return request.copyWith(headers: {
        "Authorization": "Bearer $token",
      });
    }
    return request;
  }
}
