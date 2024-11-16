// import 'package:flick_frontend/challenge/camera/provider/participants_provider.dart';
// import 'package:flick_frontend/challenge/camera/widget/participants_list.dart';
// import 'package:flick_frontend/challenge/provider/provs/challengeMain_provider_real.dart';
// import 'package:flick_frontend/common/const/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:camera/camera.dart';
// import 'package:flick_frontend/challenge/camera/displayPictureScreen.dart';
// import 'package:flick_frontend/challenge/camera/widget/camera_options.dart';
// import 'package:flick_frontend/challenge/camera/widget/capture_button.dart';
// import 'package:flick_frontend/challenge/camera/widget/focus_frame.dart';
// import 'package:flick_frontend/challenge/camera/widget/participants_avatars_widget.dart';

// class TakePictureScreen extends ConsumerStatefulWidget {
//   final String title;
//   final int challengeId;
//   final CameraController cameraController;

//   const TakePictureScreen({
//     super.key,
//     required this.title,
//     required this.challengeId,
//     required this.cameraController,
//   });

//   @override
//   ConsumerState<TakePictureScreen> createState() => _TakePictureScreenState();
// }

// class _TakePictureScreenState extends ConsumerState<TakePictureScreen> {
//   late CameraController _cameraController;

//   @override
//   void initState() {
//     super.initState();
//     _cameraController = widget.cameraController;

//     // 현재 날짜를 사용해 month와 day를 설정
//     final currentDate = DateTime.now();
//     final month = currentDate.month;
//     final day = currentDate.day;

//     // 참여자 데이터 가져오기
//     ref.read(participantsProvider.notifier).fetchParticipants(
//           widget.challengeId,
//           month,
//           day,
//         );
//   }

//   Future<void> _switchCamera(CameraLensDirection direction) async {
//     try {
//       final cameras = await availableCameras();
//       CameraDescription selectedCamera = cameras.firstWhere(
//         (camera) => camera.lensDirection == direction,
//       );

//       await _cameraController.dispose(); // 기존 카메라 컨트롤러 해제

//       _cameraController = CameraController(
//         selectedCamera,
//         ResolutionPreset.medium,
//       );

//       await _cameraController.initialize(); // 새로운 카메라 컨트롤러 초기화
//       setState(() {}); // 상태 갱신
//     } catch (e) {
//       print("카메라 전환 실패: $e");
//     }
//   }

//   @override
//   void dispose() {
//     _cameraController.dispose(); // 관리하는 카메라 컨트롤러 해제
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final participantsState = ref.watch(participantsProvider);
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     double appFontSize;

//     if (screenWidth < 600) {
//       appFontSize = screenWidth * 0.05;
//     } else if (screenWidth < 1200) {
//       appFontSize = screenWidth * 0.04;
//     } else {
//       appFontSize = screenWidth * 0.03;
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: PRIMARY_COLOR,
//         title: Center(
//           child: Text(
//             "${widget.title} 인증방",
//             style: TextStyle(color: Colors.white, fontSize: appFontSize),
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           Positioned.fill(
//               child: CameraPreview(_cameraController)), // 관리하는 카메라 컨트롤러 사용
//           const FocusFrameWidget(),
//           Positioned(
//             top: screenHeight * 0.65,
//             right: screenWidth * 0.05,
//             child: ParticipantsListWidget(
//               participants: participantsState.count, // 참여자 수
//               title: widget.title,
//             ),
//           ),
//           Positioned(
//             top: screenHeight * 0.22,
//             right: screenWidth * 0.05,
//             child: ParticipantsAvatarsWidget(
//               memberPictureUrls:
//                   participantsState.memberPictureUrls, // 프로필 이미지 URL 리스트
//             ),
//           ),
//           Positioned(
//             top: screenHeight * 0.001,
//             right: screenWidth * 0.05,
//             child: CameraOptionsWidget(
//               cameraController: _cameraController, // 관리하는 카메라 컨트롤러 사용
//               initializeCamera: _switchCamera,
//             ),
//           ),
//           Positioned(
//             bottom: screenHeight * 0.03,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: CaptureButtonWidget(onPressed: () async {
//                 try {
//                   // 이 부분이 이상한거같음
//                   final image = await _cameraController.takePicture();
//                   final challengeService =
//                       ref.read(challengeDetailsServiceProvider);

//                   await challengeService.uploadChallengeImages(
//                     challengeId: widget.challengeId, // widget.challengeId로 접근
//                     imageFiles: [image],
//                   );

//                   if (!mounted) return;

//                   await Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => DisplayPictureScreen(
//                       challengeId: widget.challengeId, // widget.challengeId로 접근
//                       imagePath: image.path,
//                       title: widget.title,
//                     ),
//                   ));
//                 } catch (e) {
//                   print('Error taking picture: $e');
//                 }
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flick_frontend/challenge/camera/displayPictureScreen.dart';
import 'package:flick_frontend/challenge/camera/provider/participants_provider.dart';
import 'package:flick_frontend/challenge/camera/widget/capture_button.dart';
import 'package:flick_frontend/challenge/camera/widget/participants_avatars_widget.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeMain_provider_real.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeMy_provider.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera/camera.dart';

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

    // 현재 날짜를 사용해 month와 day를 설정
    final currentDate = DateTime.now();
    final month = currentDate.month;
    final day = currentDate.day;

    // 참여자 데이터 가져오기
    ref.read(participantsProvider.notifier).fetchParticipants(
          widget.challengeId,
          month,
          day,
        );
  }

  @override
  void dispose() {
    _cameraController.dispose(); // 관리하는 카메라 컨트롤러 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final participantsState = ref.watch(participantsProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double appFontSize;

    if (screenWidth < 600) {
      appFontSize = screenWidth * 0.05;
    } else if (screenWidth < 1200) {
      appFontSize = screenWidth * 0.04;
    } else {
      appFontSize = screenWidth * 0.03;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Center(
          child: Text(
            "${widget.title} 인증방",
            style: TextStyle(color: Colors.white, fontSize: appFontSize),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: CameraPreview(_cameraController)), // 관리하는 카메라 컨트롤러 사용
          Positioned(
            top: screenHeight * 0.65,
            right: screenWidth * 0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ParticipantsAvatarsWidget(
                  memberPictureUrls: participantsState.memberPictureUrls,
                  participantCount: participantsState.count,
                ),
                const SizedBox(height: 8),
                Text(
                  "Join Members Count: ${participantsState.count}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: appFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.03,
            left: 0,
            right: 0,
            child: Center(
              child: CaptureButtonWidget(onPressed: () async {
                try {
                  final image = await _cameraController.takePicture();
                  final challengeService =
                      ref.read(challengeDetailsServiceProvider);
                  // 여기서 보내지는데 , 일단 그거는 나중에 display로 옮겨야하나생각중
                  // ChallengeImageParams 클래스를 활용해 month와 day 값을 설정하는 예시
                  final params = ChallengeImageParams(
                    challengeId: widget.challengeId,
                  );
                  await challengeService.uploadChallengeImages(
                    month: params.month, // ChallengeImageParams에서 가져온 month
                    day: params.day,
                    challengeId: widget.challengeId, // widget.challengeId로 접근
                    imageFiles: [image],
                  );

                  if (!mounted) return;

                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DisplayPictureScreen(
                      challengeId: widget.challengeId, // widget.challengeId로 접근
                      imagePath: image.path,
                      title: widget.title,
                    ),
                  ));
                } catch (e) {
                  print('Error taking picture: $e');
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// class ParticipantsAvatarsWidget extends StatelessWidget {
//   final List<String> memberPictureUrls;

//   const ParticipantsAvatarsWidget({
//     super.key,
//     required this.memberPictureUrls,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final displayUrls = memberPictureUrls.take(5).toList();
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Row(
//       children: displayUrls.map((url) {
//         return Padding(
//           padding: EdgeInsets.all(screenWidth * 0.01),
//           child: CircleAvatar(
//             radius: screenWidth * 0.05,
//             backgroundImage: NetworkImage(url),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
