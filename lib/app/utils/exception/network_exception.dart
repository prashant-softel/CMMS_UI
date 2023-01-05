// coverage:ignore-file
/// A network exception to catch network related errors.
class NetworkException implements Exception {
  /// [message] : A message for the exception.
  /// [errorCode] : An error code to see the status.
  NetworkException({
    required this.message,
    this.errorCode = 502,
  });

  String message;
  int? errorCode;

  @override
  String toString() => '$errorCode: $message';
}
