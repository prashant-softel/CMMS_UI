import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debounce {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debounce({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
