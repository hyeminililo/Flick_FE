import 'dart:io';
import 'package:flick_frontend/challenge/camera/fullPhotoGallery.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeMain_provider_real.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeMy_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:image_picker/image_picker.dart';

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
        backgroundColor: PRIMARY_COLOR,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.file(
              File(imagePath),
              fit: BoxFit.contain,
              width: screenWidth,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          ElevatedButton(
            onPressed: () async {
              // 서버에 이미지 업로드
              final challengeService =
                  ref.read(challengeDetailsServiceProvider);

              final params = ChallengeImageParams(
                challengeId: challengeId,
                month: DateTime.now().month,
                day: DateTime.now().day,
              );

              await challengeService.uploadChallengeImages(
                challengeId: params.challengeId,
                month: params.month,
                day: params.day,
                imageFiles: [XFile(imagePath)],
              );

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FullPhotoGalleryScreen(
                    challengeId: challengeId,
                    title: title,
                  ),
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("인증 완료!")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: PRIMARY_COLOR,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.3,
                vertical: screenHeight * 0.02,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("인증하기"),
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }
}
