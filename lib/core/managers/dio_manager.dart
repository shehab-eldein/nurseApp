import 'package:dio/dio.dart';
import 'package:nurse_space/core/constant/endPoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioManager {
  static Dio? _dioInstance;

  static Dio get dio {
    if (_dioInstance == null) {
      _dioInstance = Dio(
        BaseOptions(
          baseUrl: EndPoints.baseURL,
        ),
      );

      _dioInstance!.interceptors.clear();

      _dioInstance!.options.connectTimeout = const Duration(seconds: 60);
      _dioInstance!.options.receiveTimeout = const Duration(seconds: 60);
      _dioInstance!.options.sendTimeout = const Duration(seconds: 60);

//S
      _dioInstance!.options.headers = {
        "Authorization": "Bearer 5|SB7tM8mk48WPElYc4a4AXC2DWqzeSk1QaBSY13pJf7c55f49",
      };

      _dioInstance!.interceptors.addAll(
          [
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          error: true,
          maxWidth: 80,
        ),
            InterceptorsWrapper(
              onError: (error, handler) {
                if (error.response?.statusCode == 302) {
                  final redirectionUrl = error.response?.headers['location'];
                  print("Redirection URL: $redirectionUrl");
                  return handler.resolve(Response(
                    requestOptions: error.requestOptions,
                    data: redirectionUrl,
                    statusCode: 200,
                    statusMessage: "Redirection",
                  ));
                }
                return handler.next(error);
              },
            ),
      ]
      );
    }

    return _dioInstance!;
  }
}