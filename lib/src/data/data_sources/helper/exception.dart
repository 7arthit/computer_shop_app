import 'package:dio/dio.dart';

class NotFoundException extends DioException {
  NotFoundException(DioException ex)
      : super(
    error: ex.error,
    message: ex.message,
    requestOptions: ex.requestOptions,
    response: ex.response,
    stackTrace: ex.stackTrace,
    type: ex.type,
  );
}

class ServerException extends DioException {
  ServerException(DioException ex)
      : super(
    error: ex.error,
    message: ex.message,
    requestOptions: ex.requestOptions,
    response: ex.response,
    stackTrace: ex.stackTrace,
    type: ex.type,
  );
}

class UnAuthenticationException extends DioException {
  UnAuthenticationException(DioException ex)
      : super(
    error: ex.error,
    message: ex.message,
    requestOptions: ex.requestOptions,
    response: ex.response,
    stackTrace: ex.stackTrace,
    type: ex.type,
  );
}

class UnAuthorizedException implements DioException {
  @override
  DioException copyWith({
    RequestOptions? requestOptions,
    Response? response,
    DioExceptionType? type,
    Object? error,
    StackTrace? stackTrace,
    String? message,
  }) {
    return DioException(
      requestOptions: requestOptions ?? this.requestOptions,
      response: response ?? this.response,
      type: type ?? this.type,
      error: error ?? this.error,
      stackTrace: stackTrace ?? this.stackTrace,
      message: message ?? this.message,
    );
  }

  @override
  Object? get error => error;

  @override
  String? get message => message;

  @override
  RequestOptions get requestOptions => requestOptions;

  @override
  Response? get response => response;

  @override
  StackTrace get stackTrace => StackTrace.current;

  @override
  DioExceptionType get type => type;
}
