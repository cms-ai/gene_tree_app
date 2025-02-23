import 'package:flutter_test/flutter_test.dart';
import 'package:gene_tree_app/core/utils/helpers/helpers.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mocktail/mocktail.dart';

class MockJwtDecoder extends Mock implements JwtDecoder {}

class MockJwtHelper extends Mock implements JwtHelper {}

void main() {
  late MockJwtHelper mockJwtHelper;

  setUp(() {
    mockJwtHelper = MockJwtHelper();
  });

  group("JwtHelper tests", () {
    test('should decode userId from token', () {
      // Arrange
      const token = 'valid.token';

      when(() => mockJwtHelper.getUserIdFromToken(token)).thenReturn('12345');

      final userId = mockJwtHelper.getUserIdFromToken(token);

      expect(userId, '12345');
    });
    test('should return true if token is valid', () {
      // Arrange
      const token = 'valid.token';

      // Giả lập token hợp lệ
      when(() => mockJwtHelper.isTokenValid(token)).thenReturn(true);

      // Act
      final isValid = mockJwtHelper.isTokenValid(token);

      // Assert
      expect(isValid, true);
    });

    test('should return token expiry date', () {
      // Arrange
      const token = 'some.token';
      final expiryDate = DateTime(2025, 1, 13);

      // Giả lập ngày hết hạn của token
      when(() => mockJwtHelper.getTokenExpiryDate(token))
          .thenReturn(expiryDate);

      // Act
      final expiry = mockJwtHelper.getTokenExpiryDate(token);

      // Assert
      expect(expiry, expiryDate);
    });

    test('should return null if error occurs when getting expiry date', () {
      // Arrange
      const token = 'invalid.token';

      // Giả lập lỗi khi lấy ngày hết hạn
      when(() => mockJwtHelper.getTokenExpiryDate(token)).thenReturn(null);

      // Act
      final expiry = mockJwtHelper.getTokenExpiryDate(token);

      // Assert
      expect(expiry, null);
    });
  });
}
