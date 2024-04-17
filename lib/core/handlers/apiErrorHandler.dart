import 'package:dio/dio.dart';

class ApiErrorHandler {
  static void validateErrors(
      Response? response,
      {List<int> excludedCodes = const [],})  {
    print("enter Api Error Handler_____****");
    for (ApiError error in ApiError.values) {
     // print("enter Api Error Handler_____****");
      if (response?.statusCode == error.statusCode) {
        if (!excludedCodes.contains(error.statusCode)) {
         // print("enter Api Error Handler_____ ${response!.statusCode}****");
          throw CustomError(
            message:
            response?.data['message'] ??
                error.toString()
          );

        }
      }
    }
  }
}

class CustomError implements Exception {
  final String message;

  CustomError({required this.message});
}


enum ApiError {
  unauthorized(401),
  forbidden(403),
  notFound(404),
  requestTimeout(408),
  tooManyAttempts(422),
  unprocessableEntity(429),
  internalServerError(500),
  badGateway(502),
  serviceUnavailable(503),
  gatewayTimeout(504);

  final int statusCode;

  const ApiError(this.statusCode);

  @override
  String toString() {
    switch (this) {
      case ApiError.unauthorized:
        return 'Unauthorized';
      case ApiError.forbidden:
        return 'Forbidden';
      case ApiError.notFound:
        return 'Not Found';
      case ApiError.requestTimeout:
        return 'Request Timeout';
      case ApiError.tooManyAttempts:
        return 'Too Many Attempts';
      case ApiError.unprocessableEntity:
        return 'Unprocessable Entity';
      case ApiError.internalServerError:
        return 'Internal Server Error';
      case ApiError.badGateway:
        return 'Bad Gateway';
      case ApiError.serviceUnavailable:
        return 'Service Unavailable';
      case ApiError.gatewayTimeout:
        return 'Gateway Timeout';
    }
  }
}
