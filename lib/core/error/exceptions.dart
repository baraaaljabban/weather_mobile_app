class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}

class CacheException implements Exception {
  final String message;
  CacheException({required this.message});
}

class UnExpectedServerResponseException implements Exception {
  final String message;
  UnExpectedServerResponseException(this.message);
}

class UnExpectedSocketException implements Exception {
  final String message;
  UnExpectedSocketException(this.message);
}

class JSONException implements Exception {
  final String message;
  JSONException({required this.message});
}
