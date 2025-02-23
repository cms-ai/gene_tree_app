import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class JwtHelper {
  /// Decode JWT token và lấy thông tin userId
  String? getUserIdFromToken(String token) {
    try {
      final decodedToken = JwtDecoder.decode(token);
      return decodedToken["id"];
    } catch (e) {
      LoggerUtil.debugLog("JWT decode error: $e");
      return null;
    }
  }

  /// Kiểm tra token có hợp lệ hay không (có hết hạn chưa)
  bool isTokenValid(String token) {
    try {
      return !JwtDecoder.isExpired(token);
    } catch (e) {
      LoggerUtil.debugLog("Token validation error: $e");
      return false;
    }
  }

  /// Lấy ngày hết hạn của token
  DateTime? getTokenExpiryDate(String token) {
    try {
      return JwtDecoder.getExpirationDate(token);
    } catch (e) {
      LoggerUtil.debugLog("Token expiry error: $e");
      return null;
    }
  }
}
