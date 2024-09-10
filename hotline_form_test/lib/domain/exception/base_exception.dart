class BaseException implements Exception {
  final String message;

  const BaseException({
    required this.message,
  });
}