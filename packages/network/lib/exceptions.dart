class NetworkException implements Exception {
  final String message;
  final int? statusCode;

  NetworkException(this.message, {this.statusCode});

  @override
  String toString() =>
      "NetworkException(statusCode: $statusCode, message: $message)";
}


class ParsingException implements Exception {
  final String message;

  ParsingException(this.message);

  @override
  String toString() => "ParsingException(message: $message)";
}


class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() => "ServerException(message: $message)";
}
