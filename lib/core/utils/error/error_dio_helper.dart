import 'package:dio/dio.dart';
import 'error_strings.dart';

class DioErrorHelper {
  static String handleDioError(DioException e) {
    if (e.response != null && e.response?.statusCode != null) {
      int statusCode = e.response!.statusCode!;

      String? customErrorMessage = _getCustomErrorMessage(e.response!);

      if (customErrorMessage != null) {
        return customErrorMessage;
      }

      switch (statusCode) {
        case 400:
          return ErrorStrings.badRequestMessage;
        case 401:
          return ErrorStrings.unauthorizedMessage;
        case 404:
          return ErrorStrings.notFoundMessage;
        case 500:
          return ErrorStrings.serverErrorMessage;
        default:
          return ErrorStrings.genericErrorMessage;
      }
    } else if (e.type == DioExceptionType.connectionError) {
      return ErrorStrings.internetErrorMessage;
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return ErrorStrings.connectionTimeoutMessage;
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return ErrorStrings.receiveTimeoutMessage;
    } else if (e.type == DioExceptionType.sendTimeout) {
      return ErrorStrings.sendTimeoutMessage;
    } else if (e.type == DioExceptionType.cancel) {
      return ErrorStrings.requestCancelledMessage;
    } else {
      return ErrorStrings.genericErrorMessage;
    }
  }

  static String handleGeneralError(dynamic e) {
    if (e is DioException) {
      return handleDioError(e);
    } else {
      return ErrorStrings.genericErrorMessage;
    }
  }

  static String? _getCustomErrorMessage(Response response) {
    try {
      if (response.data != null && response.data is Map<String, dynamic>) {
        if (response.data['errors'] != null && response.data['errors'] is Map) {
          final errorMap = response.data['errors'] as Map;
          if (errorMap.containsKey('msg')) {
            return errorMap['msg'];
          }
        }
      }
    } catch (e) {
      // Log or handle any parsing errors
      return null;
    }
    return null;
  }
}
