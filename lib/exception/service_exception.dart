class ServiceException implements Exception {
  ServiceException(this.cause);
  final String cause;
}
