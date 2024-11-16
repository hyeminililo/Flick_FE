import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 카메라 상태 클래스를 정의합니다.
class CameraState {
  final CameraController? controller;
  final bool isInitialized;
  final CameraDescription? selectedCamera;

  CameraState({
    this.controller,
    this.isInitialized = false,
    this.selectedCamera,
  });
}

// 카메라 상태를 관리하는 Notifier를 정의합니다.
class CameraNotifier extends StateNotifier<CameraState> {
  CameraNotifier() : super(CameraState());

  Future<void> initializeCamera(CameraDescription cameraDescription) async {
    final controller = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
    );

    try {
      await controller.initialize();
      state = state.copyWith(
        controller: controller,
        isInitialized: true,
        selectedCamera: cameraDescription,
      );
    } catch (e) {
      print("카메라 초기화 실패: $e");
      state = state.copyWith(isInitialized: false);
    }
  }

  void disposeCamera() {
    state.controller?.dispose();
    state = state.copyWith(controller: null, isInitialized: false);
  }
}

// 카메라 상태를 제공하는 Provider
final cameraProvider =
    StateNotifierProvider<CameraNotifier, CameraState>((ref) {
  return CameraNotifier();
});

extension CameraStateCopy on CameraState {
  CameraState copyWith({
    CameraController? controller,
    bool? isInitialized,
    CameraDescription? selectedCamera,
  }) {
    return CameraState(
      controller: controller ?? this.controller,
      isInitialized: isInitialized ?? this.isInitialized,
      selectedCamera: selectedCamera ?? this.selectedCamera,
    );
  }
}
