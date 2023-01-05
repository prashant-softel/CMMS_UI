// coverage:ignore-file
/// An exception class which will be catch to see if any data was mismatched or
/// was null when passing forward
class DataException implements Exception {
  /// [message] : A message for the exception.
  DataException({
    required this.message,
  });

  String message;

  @override
  String toString() => '$message';
}
