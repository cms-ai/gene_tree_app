import 'package:flutter_test/flutter_test.dart';

import 'package:gene_tree_app/core/utils/helpers/helpers.dart'; // Để sử dụng `VoidCallback`

void main() {
  group('Throttler tests', () {
    test('should execute the action only once within the given interval', () {
      // Arrange
      final throttler = Throttler(milliseconds: 500);
      int callCount = 0;
      action() {
        callCount++;
      }

      // Act
      throttler.run(action); // Run first time
      throttler.run(action); // Try to run again immediately
      throttler.run(action); // Try to run again immediately

      // Assert
      expect(callCount, 1); // Chỉ được gọi 1 lần
    });

    test('should execute the action after the interval has passed', () async {
      // Arrange
      final throttler = Throttler(milliseconds: 500);
      int callCount = 0;
      action() {
        callCount++;
      }

      // Act
      throttler.run(action); // First run
      await Future.delayed(
          const Duration(milliseconds: 600)); // Wait for throttler
      throttler.run(action); // Run again after delay

      // Assert
      // Hành động sẽ được gọi lại sau khi thời gian trôi qua
      expect(callCount, 2);
    });
  });
}
