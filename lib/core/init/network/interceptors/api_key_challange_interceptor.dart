import 'package:dio/dio.dart';

class ApiKeyChallangeInterceptor extends Interceptor {
  final String apiKey = "&apikey=12345";
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!options.path.contains(apiKey)) {
      handler.reject(DioError(requestOptions: options));
    } else {
      handler.next(options);
    }
  }
}

class ApiKeyChallangeSolutionInterceptor extends Interceptor {
    final String apiKey = "&apikey=12345";

   @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path!=null && !options.path.contains(apiKey)) {
      options.path+=apiKey;
      handler.next(options);
    }
  }

}
