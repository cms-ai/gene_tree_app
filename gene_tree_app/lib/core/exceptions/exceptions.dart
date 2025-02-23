import 'package:dio/dio.dart';

extension HttpExceptions on DioException {
  Future<String?> getMessageError() async {
    if (response?.data != null) {
      final errorData = ErrorResponse.fromJson(response?.data);
      return errorData.message;
    }
    return message;
  }
}

class ErrorResponse {
  final int? statusCode;
  final String? errorCode;
  final String? message;

  ErrorResponse({
    required this.statusCode,
    this.errorCode,
    this.message = 'An error occurred',
  });

  // Factory constructor để chuyển đổi từ JSON
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      statusCode: json['statusCode'] ?? 400,
      errorCode: json['errorCode'],
      message: json['message'] ?? 'An error occurred',
    );
  }

  // Phương thức để chuyển đổi thành JSON (nếu cần)
  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'errorCode': errorCode,
      'message': message,
    };
  }
}

extension ExceptionError on Object {
  Future<String?> getMessageErr() async {
    if (this is DioException) {
      return (this as DioException).getMessageError();
    } else if (this is Exception) {
      String error = (this as Exception).toString();

      if (error.contains("Exception:")) {
        error = error.replaceAll("Exception:", "").trim();
      }
      return error;
    }
    return toString();
  }
}
