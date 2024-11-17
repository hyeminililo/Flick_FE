import 'package:flick_frontend/challenge/camera/fullPhotoGallery.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/challenge/camera/provider/participants_provider.dart';

class ParticipantsListWidget extends ConsumerWidget {
  final String title;
  final int challengeId; // 챌린지 ID를 추가

  const ParticipantsListWidget({
    super.key,
    required this.title,
    required this.challengeId, // 챌린지 ID 추가
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final double fontSize = screenWidth * 0.06;

    // participantsProvider에서 참여자 수와 관련된 상태를 가져옴
    final participantsState = ref.watch(participantsProvider);

    // 참여자 수를 확인하고 표시
    String displayText =
        participantsState.count >= 10 ? '+10' : '+${participantsState.count}';

    return SizedBox(
      height: screenHeight * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.translate(
            offset: Offset(0, -screenHeight * 0.03),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
              decoration: BoxDecoration(
                color: PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                '총 ${participantsState.count}명 인증중',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize * 0.65,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5.0),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FullPhotoGalleryScreen(
                    title: title,
                    challengeId: challengeId, // 챌린지 ID 전달
                  ),
                ),
              );
            },
            child: Container(
              width: screenWidth * 0.1,
              height: screenHeight * 0.05,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  displayText,
                  style: TextStyle(
                    color: PRIMARY_COLOR,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:flick_frontend/challenge/camera/fullPhotoGallery.dart';
// import 'package:flick_frontend/common/const/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flick_frontend/challenge/camera/provider/participants_provider.dart';

// class ParticipantsListWidget extends ConsumerWidget {
//   final String title;

//   const ParticipantsListWidget({
//     super.key,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final double fontSize = screenWidth * 0.06;

//     // participantsProvider에서 참여자 수와 관련된 상태를 가져옴
//     final participantsState = ref.watch(participantsProvider);

//     // 참여자 수를 확인하고 표시
//     String displayText =
//         participantsState.count >= 10 ? '+10' : '+${participantsState.count}';

//     return SizedBox(
//       height: screenHeight * 0.06,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Transform.translate(
//             offset: Offset(0, -screenHeight * 0.03),
//             child: Container(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
//               decoration: BoxDecoration(
//                 color: PRIMARY_COLOR,
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               child: Text(
//                 '총 ${participantsState.count}명 인증중',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: fontSize * 0.65,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 5.0),
//           GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => FullPhotoGalleryScreen(
//                     title: title,
//   // 여기 부분challlengeId 받아줘야함
//                     challengeId: ,
//                   ),
//                 ),
//               );
//             },
//             child: Container(
//               width: screenWidth * 0.1,
//               height: screenHeight * 0.05,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 6.0,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Center(
//                 child: Text(
//                   displayText,
//                   style: TextStyle(
//                     color: PRIMARY_COLOR,
//                     fontSize: fontSize,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
