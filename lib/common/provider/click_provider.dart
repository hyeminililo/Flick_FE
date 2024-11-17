// ClickStateProvider 정의
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClickStateNotifier extends StateNotifier<bool> {
  ClickStateNotifier() : super(false);

  void startProcessing() => state = true;

  void stopProcessing() => state = false;
}

final clickStateProvider = StateNotifierProvider<ClickStateNotifier, bool>(
  (ref) => ClickStateNotifier(),
);
