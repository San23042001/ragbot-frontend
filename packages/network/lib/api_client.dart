import 'package:dio/dio.dart';
import 'package:core/core.dart'; // gives you AskRequest + Logger
import 'endpoints.dart';
import 'exceptions.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: Endpoints.baseUrl,
              connectTimeout: const Duration(seconds: 50),
              receiveTimeout: const Duration(seconds: 50),
              sendTimeout: const Duration(seconds: 50),
              headers: {"Content-Type": "application/json"},
            ),
          );

  /// Ask backend a question using AskRequest model from CORE.
  Future<String> ask(AskRequest request) async {
    final body = request.toJson();

    logInfo("NETWORK", "POST → ${Endpoints.ask} | body: $body");

    try {
      final response = await _dio.post(Endpoints.ask, data: body);

      logSuccess(
        "NETWORK",
        "Response (${response.statusCode}): ${response.data}",
      );

      if (response.statusCode == 200) {
        return response.data["answer"] ?? "";
      }

      throw ServerException("Unexpected server response");
    } on DioException catch (e) {
      logErrorObject("NETWORK", e, "Dio error");

      if (e.response != null) {
        throw NetworkException(
          e.response?.data.toString() ?? "Unknown error",
          statusCode: e.response?.statusCode,
        );
      }
      throw NetworkException("Network error occurred");
    } catch (e) {
      logErrorObject("NETWORK", e, "Unknown client error");
      throw NetworkException("Unknown error");
    }
  }
}
