import 'package:camera/camera.dart';
import 'package:flick_frontend/challenge/camera/displayPictureScreen.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeDetails_provider.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeMy_provider.dart';
import 'package:flick_frontend/challenge/view/%08challengeAuth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/common/const/colors.dart';

class TakePictureScreen extends ConsumerStatefulWidget {
  final String title;
  final int challengeId;
  final CameraController cameraController;

  const TakePictureScreen({
    super.key,
    required this.title,
    required this.challengeId,
    required this.cameraController,
  });

  @override
  ConsumerState<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends ConsumerState<TakePictureScreen> {
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    _cameraController = widget.cameraController;
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          // 카메라 미리보기
          Positioned.fill(
            child: CameraPreview(_cameraController),
          ),
          // 사진 촬영 버튼
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.03,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    // 사진 촬영
                    final image = await _cameraController.takePicture();

                    if (!mounted) return;

                    // DisplayPictureScreen으로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayPictureScreen(
                          challengeId: widget.challengeId,
                          imagePath: image.path,
                          title: widget.title,
                        ),
                      ),
                    );
                  } catch (e) {
                    print('Error taking picture: $e');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  '사진 촬영',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 40,
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          final DateTime selectedDate = DateTime.now();

          // 인증 사진 화면으로 이동
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChallengeAuthImagesScreen(
                title: '참여자 인증 사진',
                challengeId: widget.challengeId,
                selectedDate: selectedDate,
              ),
            ),
          );
        },
        child: Consumer(
          builder: (context, ref, _) {
            final imageCountAsync = ref.watch(
              userChallengeAuthImagesCountProvider(
                ChallengeImageParams(
                  challengeId: widget.challengeId,
                  month: DateTime.now().month,
                  day: DateTime.now().day,
                ),
              ),
            );

            return imageCountAsync.when(
              data: (count) =>
                  Text('+$count', style: const TextStyle(fontSize: 16)),
              loading: () => const CircularProgressIndicator(
                color: Colors.white,
              ),
              error: (error, stack) => const Icon(Icons.error),
            );
          },
        ),
      ),

      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
