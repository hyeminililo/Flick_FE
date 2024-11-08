import 'dart:io';
import 'package:flick_frontend/challenge/provider/provs/challengeMain_provider_real.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flick_frontend/challenge/camera/fullPhotoGallery.dart'; // FullPhotoGallery 임포트

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final int challengeId;

  const DisplayPictureScreen(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.challengeId});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("$title 사진 확인"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
        children: [
          Expanded(
            child: Image.file(
              File(imagePath),
              fit: BoxFit.contain,
              width: screenWidth,
            ), // 이미지 표시
          ),
          SizedBox(height: screenHeight * 0.05), // 이미지와 버튼 사이의 간격
          ElevatedButton(
            onPressed: () async {
              // 서버에 사진을 전송하는 로직이 있다고 가정합니다.
              final challengeService =
                  ref.read(challengeDetailsServiceProvider);

              await challengeService.uploadChallengeImages(
                challengeId: widget.challengeId, // widget.challengeId로 접근
                imageFiles: [image],
              );
              await uploadImageToServer(imagePath); // 서버로 이미지 업로드

              // 사진 전송 완료 후 FullPhotoGallery로 이동
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FullPhotoGalleryScreen(
                    challengeId: challengeId,
                    title: title,
                  ),
                ),
              );

              // 인증 완료 메시지
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("인증 완료!")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: PRIMARY_COLOR,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.345,
                vertical: screenHeight * 0.02,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("인증하기"), // 버튼 텍스트
          ),
          SizedBox(height: screenHeight * 0.05), // 버튼 아래 간격
        ],
      ),
    );
  }
}
