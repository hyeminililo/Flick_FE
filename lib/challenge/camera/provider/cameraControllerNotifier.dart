import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraControllerProvider = Provider<CameraController?>((ref) {
  return null; // 초기값 null
});

final cameraControllerNotifierProvider =
    StateNotifierProvider<CameraControllerNotifier, CameraController?>((ref) {
  return CameraControllerNotifier();
});

class CameraControllerNotifier extends StateNotifier<CameraController?> {
  CameraControllerNotifier() : super(null);

  Future<void> initializeCamera() async {
    if (state != null && state!.value.isInitialized) return; // 이미 초기화된 경우 무시

    final cameras = await availableCameras();
    state = CameraController(
      cameras.first,
      ResolutionPreset.medium,
    );
    await state!.initialize();
  }

  void disposeController() {
    state?.dispose();
    state = null;
  }
}
