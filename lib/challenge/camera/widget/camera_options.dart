import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraOptionsWidget extends StatelessWidget {
  final CameraController cameraController;
  final Future<void> Function(CameraLensDirection) initializeCamera;

  const CameraOptionsWidget({
    super.key,
    required this.cameraController,
    required this.initializeCamera,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: screenHeight * 0.07), // 버튼 위 여백
        IconButton(
          icon: const Icon(Icons.cameraswitch, color: Colors.white),
          iconSize: screenWidth * 0.1, // 아이콘 크기를 화면 너비의 10%로 설정
          onPressed: () async {
            if (cameraController.description.lensDirection ==
                CameraLensDirection.back) {
              await initializeCamera(CameraLensDirection.front);
            } else {
              await initializeCamera(CameraLensDirection.back);
            }
          },
        ),
      ],
    );
  }
}
