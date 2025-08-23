import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Time out with Api Server');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            'Connection failed due to an invalid security certificate. Please try again later.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('The request was canceled.');
      case DioExceptionType.connectionError:
        return ServerFailure(
            'No internet connection. Please check your network and try again');
      case DioExceptionType.unknown:
        return ServerFailure(
            'An unexpected error occurred. Please try again later.');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Not Found , please try again');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error');
    } else {
      return ServerFailure('Oop there was an error ,please try later');
    }
  }
}
