import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerUtil {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
    level: kReleaseMode ? Level.warning : Level.all,
  );

  ///
  /// Debug log
  ///
  static void debugLog(String message) => _logger.d(message);

  ///
  /// Information log
  ///
  static void infoLog(String message) => _logger.i(message);

  ///
  /// Warning log
  ///
  static void warningLog(String message) => _logger.w(message);

  ///
  /// Error log
  ///
  static void errorLog(String message) => _logger.e(message);
}
