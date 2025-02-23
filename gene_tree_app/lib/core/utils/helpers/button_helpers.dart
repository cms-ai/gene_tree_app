import 'dart:async';
import 'dart:ui';

class Throttler {
  final int milliseconds;
  Timer? _timer;

  Throttler({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer == null || !_timer!.isActive) {
      action();
      _timer = Timer(Duration(milliseconds: milliseconds), () {});
    }
  }
}