// import 'package:flick_frontend/challenge/camera/provider/cameraControllerNotifier.dart';
// import 'package:flick_frontend/challenge/camera/provider/participants_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:camera/camera.dart';
// import 'package:flick_frontend/challenge/camera/displayPictureScreen.dart';
// import 'package:flick_frontend/challenge/camera/widget/camera_options.dart';
// import 'package:flick_frontend/challenge/camera/widget/camera_preview.dart';
// import 'package:flick_frontend/challenge/camera/widget/capture_button.dart';
// import 'package:flick_frontend/challenge/camera/widget/focus_frame.dart';
// import 'package:flick_frontend/challenge/camera/widget/participants_list.dart';
// import 'package:flick_frontend/challenge/camera/widget/participants_avatars_widget.dart';

// class TakePictureScreen extends ConsumerStatefulWidget {
//   final String title;
//   final int challengeId;

//   const TakePictureScreen({
//     super.key,
//     required this.title,
//     required this.challengeId,
//   });

//   @override
//   ConsumerState<TakePictureScreen> createState() => _TakePictureScreenState();
// }

// class _TakePictureScreenState extends ConsumerState<TakePictureScreen> {
//   late Future<void> _initializeCameraFuture; // 카메라 초기화 Future 추가

//   @override
//   void initState() {
//     super.initState();
//     _initializeCameraFuture =
//         _initializeCamera(CameraLensDirection.back); // 초기 카메라 방향 설정
//     ref
//         .read(participantsProvider.notifier)
//         .fetchParticipants(widget.challengeId);
//   }

//   Future<void> _initializeCamera(CameraLensDirection direction) async {
//     final cameras = await availableCameras();
//     CameraDescription selectedCamera = cameras.firstWhere(
//       (camera) => camera.lensDirection == direction,
//       orElse: () => throw Exception('No camera found'), // 카메라가 없을 경우 예외 처리
//     );

//     // 카메라 초기화
//     await ref.read(cameraProvider.notifier).initializeCamera(selectedCamera);

//     // mounted 체크
//     if (!mounted) return;
//   }

//   @override
//   void dispose() {
//     ref.read(cameraProvider.notifier).disposeCamera();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cameraState = ref.watch(cameraProvider);
//     final participantsState = ref.watch(participantsProvider);

//     return Scaffold(
//       body: Stack(
//         children: [
//           // 카메라가 초기화되었고 컨트롤러가 null이 아닐 때만 CameraPreviewWidget을 사용
//           FutureBuilder<void>(
//             future: _initializeCameraFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                     child: CircularProgressIndicator()); // 카메라 초기화 중 로딩 표시
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('카메라 초기화 실패: ${snapshot.error}'));
//               } else if (cameraState.isInitialized &&
//                   cameraState.controller != null) {
//                 return CameraPreviewWidget(
//                   initializeControllerFuture:
//                       cameraState.controller!.initialize(),
//                   cameraController: cameraState.controller!,
//                   title: widget.title,
//                 );
//               } else {
//                 return const Center(child: Text('카메라가 초기화되지 않았습니다.'));
//               }
//             },
//           ),
//           const FocusFrameWidget(),
//           ParticipantsListWidget(
//             participants: participantsState.count,
//             title: widget.title,
//           ),
//           ParticipantsAvatarsWidget(
//             memberPictureUrls: participantsState.memberPictureUrls,
//           ),
//           CameraOptionsWidget(
//             cameraController: cameraState.controller ??
//                 CameraController(
//                   cameraState.selectedCamera!,
//                   ResolutionPreset.high, // 해상도 설정
//                 ),
//             initializeCamera: (direction) => _initializeCamera(direction),
//           ),
//           CaptureButtonWidget(
//             onPressed: () async {
//               try {
//                 // 카메라 컨트롤러가 null일 경우를 처리
//                 if (cameraState.controller != null) {
//                   final image = await cameraState.controller!.takePicture();

//                   if (!mounted) return;

//                   await Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => DisplayPictureScreen(
//                       imagePath: image.path,
//                       title: widget.title,
//                     ),
//                   ));
//                 }
//               } catch (e) {
//                 print('Error taking picture: $e');
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flick_frontend/challenge/camera/provider/cameraControllerNotifier.dart';
import 'package:flick_frontend/challenge/camera/provider/participants_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:flick_frontend/challenge/camera/displayPictureScreen.dart';
import 'package:flick_frontend/challenge/camera/widget/camera_options.dart';
import 'package:flick_frontend/challenge/camera/widget/camera_preview.dart';
import 'package:flick_frontend/challenge/camera/widget/capture_button.dart';
import 'package:flick_frontend/challenge/camera/widget/focus_frame.dart';
import 'package:flick_frontend/challenge/camera/widget/participants_list.dart';
import 'package:flick_frontend/challenge/camera/widget/participants_avatars_widget.dart';

class TakePictureScreen extends ConsumerStatefulWidget {
  final String title;
  final int challengeId;

  const TakePictureScreen({
    super.key,
    required this.title,
    required this.challengeId,
  });

  @override
  ConsumerState<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends ConsumerState<TakePictureScreen> {
  late Future<void> _initializeCameraFuture;

  @override
  void initState() {
    super.initState();
    _initializeCameraFuture =
        _initializeCamera(CameraLensDirection.back); // 초기 카메라 방향 설정
    ref
        .read(participantsProvider.notifier)
        .fetchParticipants(widget.challengeId);
  }

  Future<void> _initializeCamera(CameraLensDirection direction) async {
    final cameras = await availableCameras();
    CameraDescription selectedCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == direction,
      orElse: () => throw Exception('No camera found'),
    );

    await ref.read(cameraProvider.notifier).initializeCamera(selectedCamera);

    if (!mounted) return;
  }

  @override
  void dispose() {
    ref.read(cameraProvider.notifier).disposeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cameraState = ref.watch(cameraProvider);
    final participantsState = ref.watch(participantsProvider);

    return Scaffold(
      body: Stack(
        children: [
          // 수정된 FutureBuilder 부분
          FutureBuilder<void>(
            future: _initializeCameraFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('카메라 초기화 실패: ${snapshot.error}'));
              } else if (cameraState.isInitialized &&
                  cameraState.controller != null) {
                return CameraPreviewWidget(
                  initializeControllerFuture:
                      cameraState.controller!.initialize(),
                  cameraController: cameraState.controller!,
                  title: widget.title,
                );
              } else {
                return const Center(child: Text('카메라가 초기화되지 않았습니다.'));
              }
            },
          ),
          const FocusFrameWidget(),
          ParticipantsListWidget(
            participants: participantsState.count,
            title: widget.title,
          ),
          ParticipantsAvatarsWidget(
            memberPictureUrls: participantsState.memberPictureUrls,
          ),
          CameraOptionsWidget(
            cameraController: cameraState.controller ??
                CameraController(
                  cameraState.selectedCamera!,
                  ResolutionPreset.high,
                ),
            initializeCamera: (direction) => _initializeCamera(direction),
          ),
          CaptureButtonWidget(
            onPressed: () async {
              try {
                if (cameraState.controller != null) {
                  final image = await cameraState.controller!.takePicture();

                  if (!mounted) return;

                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DisplayPictureScreen(
                      imagePath: image.path,
                      title: widget.title,
                    ),
                  ));
                }
              } catch (e) {
                print('Error taking picture: $e');
              }
            },
          ),
        ],
      ),
    );
  }
}
