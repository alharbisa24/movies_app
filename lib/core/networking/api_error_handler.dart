import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
                  "Connection to the server failed due to internet connection");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: "Send timeout in connection with the server");
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      // Handle JSON parsing errors and other exceptions
      final errorMessage = error.toString();
      if (errorMessage.contains('type') || 
          errorMessage.contains('null') || 
          errorMessage.contains('FormatException') ||
          errorMessage.contains('TypeError')) {
        return ApiErrorModel(
          message: "Failed to parse search results. Some movies may have missing data.",
        );
      }
      return ApiErrorModel(message: "Unknown error occurred: $errorMessage");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    message: data['message'] ?? "Unknown error occurred",
    code: data['code'],
    errors: data['data'],
  );
}