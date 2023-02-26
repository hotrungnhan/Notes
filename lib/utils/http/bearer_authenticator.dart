import 'dart:async';

import 'package:chopper/chopper.dart';

abstract class TokenGetter {
  FutureOr<String?> getToken();
}

class BearerAuthenticator implements Authenticator {
  final TokenGetter tokenProvider;
  BearerAuthenticator.from(this.tokenProvider);
  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) async {
    // ignore: unnecessary_null_comparison
    var token = await tokenProvider.getToken();
    if (token != null) {
      return request.copyWith(headers: {
        "Authorization": "Bearer $token",
      });
    }
    return request;
  }
}
