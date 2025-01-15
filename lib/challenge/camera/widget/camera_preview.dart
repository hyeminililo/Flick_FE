import 'package:camera/camera.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

class CameraPreviewWidget extends StatelessWidget {
  final Future<void>? initializeControllerFuture; // Future<void>?로 수정
  final CameraController cameraController;
  final String title;

  const CameraPreviewWidget({
    super.key,
    required this.initializeControllerFuture,
    required this.cameraController,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double appFontSize;

    // 폰트 사이즈를 화면 너비에 기반해 조정
    if (screenWidth < 600) {
      appFontSize = screenWidth * 0.05; // 5% 크기
    } else if (screenWidth < 1200) {
      appFontSize = screenWidth * 0.04; // 4% 크기
    } else {
      appFontSize = screenWidth * 0.03; // 3% 크기
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Center(
          child: Text(
            "$title 인증방",
            style: TextStyle(color: Colors.white, fontSize: appFontSize),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<void>(
        future: initializeControllerFuture, // FutureBuilder에서 null 체크
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CameraPreview(cameraController),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
