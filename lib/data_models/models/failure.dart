import 'dart:io';
import 'package:bingo_wholesale/const/all_const.dart';

import '../enums/data_source.dart';

class Failure {
  int code; // 200 or 400
  bool status; // 200 or 400
  String message; // error or success

  Failure(this.code, this.message, this.status);
}

class ResponseCode {
  // API status codes
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no content
  static const int badRequest = 400; // failure, api rejected the request
  static const int forbidden = 403; // failure, api rejected the request
  static const int unauthorized = 401; // failure user is not authorised
  static const int notFound =
      404; // failure, api url is not correct and not found
  static const int internalServerError =
      500; // failure, crash happened in server side

  // local status code
  static const int defaultError = -1;
  static const int connecError = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static const String success = AppString.success; // success with data
  static const String noContent =
      AppString.noContent; // success with no content
  static const String badRequestError =
      AppString.badRequestError; // failure, api rejected our request
  static const String forbiddenError =
      AppString.forbiddenError; // failure,  api rejected our request
  static const String unauthorizedError =
      AppString.unauthorizedError; // failure, user is not authorised
  static const String notFoundError = AppString
      .notFoundError; // failure, API url is not correct and not found in api side.
  static const String internalServerError =
      AppString.internalServerError; // failure, a crash happened in API side.

  // local responses codes
  static const String defaultError =
      AppString.defaultError; // unknown error happened
  static const String connectTimeout =
      AppString.timeoutError; // issue in connectivity
  static const String cancel =
      AppString.defaultError; // API request was cancelled
  static const String receiveTimeout =
      AppString.timeoutError; //  issue in connectivity
  static const String sendTimeout =
      AppString.timeoutError; //  issue in connectivity
  static const String cacheError = AppString
      .defaultError; //  issue in getting data from local data source (cache)
  static const String noInternetError =
      AppString.noInternetError; // issue in connectivity
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest,
            ResponseMessage.badRequestError.trim(), false);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden,
            ResponseMessage.forbiddenError.trim(), false);
      case DataSource.unauthorised:
        return Failure(ResponseCode.unauthorized,
            ResponseMessage.unauthorizedError.trim(), false);
      case DataSource.notFound:
        return Failure(
            ResponseCode.notFound, ResponseMessage.notFoundError.trim(), false);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError.trim(), false);
      case DataSource.connectTimeout:
        return Failure(ResponseCode.connecError,
            ResponseMessage.connectTimeout.trim(), false);
      case DataSource.cancel:
        return Failure(
            ResponseCode.cancel, ResponseMessage.cancel.trim(), false);
      case DataSource.receiveTimeout:
        return Failure(ResponseCode.receiveTimeout,
            ResponseMessage.receiveTimeout.trim(), false);
      case DataSource.sendTimeoutT:
        return Failure(ResponseCode.sendTimeout,
            ResponseMessage.sendTimeout.trim(), false);
      case DataSource.cacheError:
        return Failure(
            ResponseCode.cacheError, ResponseMessage.cacheError.trim(), false);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetError.trim(), false);
      case DataSource.defaultError:
        return Failure(
            ResponseCode.defaultError, ResponseMessage.defaultError, false);
      default:
        return Failure(
            ResponseCode.defaultError, ResponseMessage.defaultError, false);
    }
  }
}

class AppExceptions implements Exception {
  late Failure failure;

  AppExceptions.handle(dynamic error) {
    if (error is HttpResponse) {
      failure = _handleException(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }

  Failure _handleException(HttpResponse error) {
    switch (error.statusCode) {
      case ResponseCode.connecError:
        return DataSource.connectTimeout.getFailure();
      case ResponseCode.sendTimeout:
        return DataSource.sendTimeoutT.getFailure();
      case ResponseCode.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();

      case ResponseCode.badRequest:
        return DataSource.badRequest.getFailure();
      case ResponseCode.forbidden:
        return DataSource.forbidden.getFailure();
      case ResponseCode.unauthorized:
        return DataSource.unauthorised.getFailure();
      case ResponseCode.notFound:
        return DataSource.notFound.getFailure();
      case ResponseCode.internalServerError:
        return DataSource.internalServerError.getFailure();

      case ResponseCode.cancel:
        return DataSource.cancel.getFailure();

      default:
        return DataSource.defaultError.getFailure();
    }
  }
}
