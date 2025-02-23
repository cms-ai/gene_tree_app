import 'package:flutter_test/flutter_test.dart';
import 'package:gene_tree_app/core/exceptions/exceptions.dart';
import 'package:gene_tree_app/core/utils/helpers/helpers.dart';

// Chạy unit test trong chế độ debug
void main() {
  test('getDefaultError should return message and errorCode', () {
    const mockError = "Error fake";

    // Tạo đối tượng ErrorResponse
    final errorResponse =
        ErrorResponse(message: mockError, errorCode: "404", statusCode: 404);

    // Kiểm tra nếu là debug mode
    expect(errorResponse.getDefaultError(), "$mockError\n(404)");
  });

  test('getDefaultError should return default message if  null and errorCode ',
      () {
    // Bật chế độ debug (set kDebugMode = true)

    // Tạo đối tượng ErrorResponse
    final errorResponse =
        ErrorResponse(message: null, errorCode: "404", statusCode: 404);

    // Kiểm tra nếu là debug mode
    expect(errorResponse.getDefaultError(), "An error occurred\n(404)");
  });
}
