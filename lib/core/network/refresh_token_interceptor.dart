import 'package:dio/dio.dart';
import 'endpoints.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;

  RefreshTokenInterceptor(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = Endpoints.refreshToken;
        final response = await dio.post('/refresh-token', data: {'refresh_token': refreshToken});
        if (response.statusCode == 200) {
          Endpoints.api_token = response.data['access_token'];
          err.requestOptions.headers['Authorization'] = Endpoints.api_token;
          final retryResponse = await dio.request(
            err.requestOptions.path,
            options: Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers,
            ),
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );
          return handler.resolve(retryResponse);
        }
      } catch (e) {
        // Handle refresh token error
      }
    }
    return handler.next(err);
  }
}
