import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_app/core/error_model.dart';


part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(String reason) =
  UnauthorizedRequest;

  const factory NetworkExceptions.youCanNotEnter(String reason) =
  YouCanNotEnter;

  const factory NetworkExceptions.noContent(String reason) = NoContent;

  const factory NetworkExceptions.badRequest(String reason) = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed(String reason) = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.unprocessableEntity(String reason) = UnprocessableEntity;

  const factory NetworkExceptions.conflict(String reason) = Conflict;

  const factory NetworkExceptions.internalServerError(String reason) = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions handleResponse(Response? response) {
    ErrorModel listOfErrors = ErrorModel.fromJson(response?.data);

    String allErrors = listOfErrors.statusMessage!;

    int statusCode = response?.statusCode ?? 0;

    print(statusCode);
    print(allErrors);
    switch (statusCode) {
      case 400:
        return NetworkExceptions.badRequest(allErrors);
      case 403:
        return NetworkExceptions.unauthorizedRequest(allErrors);
      case 204:
        return NetworkExceptions.noContent(allErrors);
      case 404:
        return NetworkExceptions.notFound(allErrors);
      case 409:
        return  NetworkExceptions.conflict(allErrors);
      case 422:
        return NetworkExceptions.unprocessableEntity(allErrors);
      case 408:
        return const NetworkExceptions.requestTimeout();
      case 405:
        return  NetworkExceptions.methodNotAllowed(allErrors);
      case 500:
        return  NetworkExceptions.internalServerError(allErrors);
      default:
        var responseCode = statusCode;
        return NetworkExceptions.defaultError(
          "Received invalid status code: $responseCode",
        );
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions? networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioExceptionType.unknown:
              networkExceptions =
              const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badResponse:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            default:
              DioExceptionType.badCertificate;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions!;
      } on FormatException catch (e) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(
      notImplemented: () {
        errorMessage = "Not Implemented";
      },
      requestCancelled: () {
        errorMessage = "Request Cancelled";
      },
      internalServerError: (String reason) {
        errorMessage = reason;
      },
      notFound: (String reason) {
        errorMessage = reason;
      },
      serviceUnavailable: () {
        errorMessage = "Service unavailable";
      },
      methodNotAllowed: (String reason) {
        errorMessage = reason;
      },
      badRequest: (String reason) {
        errorMessage = reason;
      },
      unauthorizedRequest: (String error) {
        errorMessage = "غير مصرح لك";
      },
      unprocessableEntity: (String error) {
        errorMessage = error;
      },
      unexpectedError: () {
        errorMessage = "غير مصرح لك";
      },
      requestTimeout: () {
        errorMessage = "Connection request timeout";
      },
      noInternetConnection: () {
        errorMessage = "No internet connection";
      },
      conflict: (String error) {
        errorMessage = error;
      },
      sendTimeout: () {
        errorMessage = "Send timeout in connection with API server";
      },
      unableToProcess: () {
        errorMessage = "Unable to process the data";
      },
      defaultError: (String error) {
        errorMessage = error;
      },
      formatException: () {
        errorMessage = "Unexpected error occurred";
      },
      notAcceptable: () {
        errorMessage = "Not acceptable";
      },
      youCanNotEnter: (String reason) {
        errorMessage = reason;
      },
      noContent: (String reason) {
        errorMessage = reason;
      },
    );
    return errorMessage;
  }
}
