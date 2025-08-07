import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/api_constants.dart';

@injectable
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['api_key'] = ApiConstants.apiKey;

    if (!options.queryParameters.containsKey('language')) {
      options.queryParameters['language'] = AppConstants.defaultLanguage;
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        err = err.copyWith(
          message: 'Connection timeout. Please check your internet connection.',
        );
        break;
      case DioExceptionType.connectionError:
        err = err.copyWith(
          message: 'Network error. Please check your internet connection.',
        );
        break;
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        switch (statusCode) {
          case 401:
            err = err.copyWith(message: 'Invalid API key.');
            break;
          case 404:
            err = err.copyWith(message: 'Resource not found.');
            break;
          case 500:
            err = err.copyWith(
              message: 'Server error. Please try again later.',
            );
            break;
          default:
            err = err.copyWith(message: 'Something went wrong.');
        }
        break;
      default:
        err = err.copyWith(message: 'Unexpected error occurred.');
    }

    super.onError(err, handler);
  }
}
