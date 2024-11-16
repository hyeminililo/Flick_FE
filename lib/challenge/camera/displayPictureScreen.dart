import 'dart:io';
import 'package:flick_frontend/challenge/provider/provs/challengeMain_provider_real.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeMy_provider.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/challenge/camera/fullPhotoGallery.dart';
import 'package:image_picker/image_picker.dart'; // XFile 사용을 위해 import

class DisplayPictureScreen extends ConsumerWidget {
  final String imagePath;
  final String title;
  final int challengeId;

  const DisplayPictureScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.challengeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            // 이 이미지가 로컬에서 받아오는 거 같은데 어떻게 해야할지 모르겠어 -> 아 이게 인증한 사진 말하는거네

            child: Image.file(
              File(imagePath),
              fit: BoxFit.contain,
              width: screenWidth,
            ), // 이미지 표시
          ),
          SizedBox(height: screenHeight * 0.05), // 이미지와 버튼 사이의 간격
          ElevatedButton(
            onPressed: () async {
              // Accessing the challengeServiceProvider with ref
              final challengeService =
                  ref.read(challengeDetailsServiceProvider);
              // now로 오늘 조회 날짜 같이 보내기
// ChallengeImageParams 클래스를 활용해 month와 day 값을 설정하는 예시
              final params = ChallengeImageParams(
                challengeId: challengeId,
              );

// 해당 위치에서 uploadChallengeImages를 호출하면서 month와 day를 전달
              await challengeService.uploadChallengeImages(
                challengeId: params.challengeId,
                month: params.month, // ChallengeImageParams에서 가져온 month
                day: params.day, // ChallengeImageParams에서 가져온 day
                imageFiles: [
                  XFile(imagePath), // XFile로 변환된 이미지 파일
                ],
              );

              // Navigate to FullPhotoGalleryScreen after image upload
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FullPhotoGalleryScreen(
                    challengeId: challengeId,
                    title: title,
                  ),
                ),
              );

              // Show a confirmation message
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
