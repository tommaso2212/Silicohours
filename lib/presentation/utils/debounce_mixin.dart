import 'dart:async';

import 'package:flutter/foundation.dart';

mixin DebounceMixin {
  Timer? _debounceTimer;

  void debounce(
    VoidCallback action, {
    Duration delay = const Duration(milliseconds: 300),
  }) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(delay, action);
  }

  void cancelDebounce() {
    _debounceTimer?.cancel();
    _debounceTimer = null;
  }
}
