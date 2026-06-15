import 'dart:async';

mixin DebounceMixin {
  Timer? _debounceTimer;

  void debounce(void Function() action, {Duration delay = const Duration(milliseconds: 300)}) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(delay, action);
  }

  void cancelDebounce() {
    _debounceTimer?.cancel();
    _debounceTimer = null;
  }
}
