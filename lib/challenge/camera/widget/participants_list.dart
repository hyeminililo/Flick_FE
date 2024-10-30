// import 'package:flick_frontend/challenge/camera/fullPhotoGallery.dart';
// import 'package:flick_frontend/common/const/colors.dart';
// import 'package:flutter/material.dart';

// class ParticipantsListWidget extends StatelessWidget {
//   final int participants;
//   final String title;

//   const ParticipantsListWidget({
//     super.key,
//     required this.participants,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final double fontSize = screenWidth * 0.06; // 동적 폰트 사이즈 설정

//     // 인증한 회원 수가 10 이상이면 "+10"으로 고정
//     String displayText = participants >= 10 ? '+10' : '+$participants';

//     return Stack(
//       children: [
//         Positioned(
//           bottom: screenHeight * 0.16, // 화면 높이의 20%로 위치 조정
//           right: screenWidth * 0.05, // 화면 너비의 5%로 오른쪽 위치 조정
//           child: GestureDetector(
//             onTap: () {
//               // 전체 사진 조회 페이지로 이동
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => FullPhotoGalleryScreen(
//                     title: title,
//                   ),
//                 ),
//               );
//             },
//             child: Container(
//               width: screenWidth * 0.1, // 버튼의 너비를 화면 너비의 10%로 설정
//               height: screenHeight * 0.05, // 버튼의 높이를 화면 높이의 5%로 설정
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle, // 원 형태
//                 color: Colors.white, // 버튼 배경 색
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
//                   displayText, // 참여자 수 표시
//                   style: TextStyle(
//                     color: PRIMARY_COLOR,
//                     fontSize: fontSize, // 동적 폰트 사이즈
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: screenHeight * 0.213, // 말풍선 높이를 화면 높이의 25%로 조정
//           right: screenWidth * 0.05, // 말풍선 위치 조정
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
//             decoration: BoxDecoration(
//               color: PRIMARY_COLOR, // 말풍선 배경 색
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   '총 $participants명 인증중', // 총 참여자 수 텍스트
//                   style: TextStyle(
//                     color: Colors.white, // 텍스트 색상
//                     fontSize: fontSize * 0.65, // 동적 폰트 사이즈
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flick_frontend/challenge/camera/fullPhotoGallery.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

class ParticipantsListWidget extends StatelessWidget {
  final int participants;
  final String title;

  const ParticipantsListWidget({
    super.key,
    required this.participants,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final double fontSize = screenWidth * 0.06; // 동적 폰트 사이즈 설정

    // 인증한 회원 수가 10 이상이면 "+10"으로 고정
    String displayText = participants >= 10 ? '+10' : '+$participants';

    return SizedBox(
      height: screenHeight * 0.06, // Row의 높이를 동적으로 설정
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // 오른쪽 끝 정렬
        crossAxisAlignment: CrossAxisAlignment.center, // 수직 중앙 정렬
        children: [
          // 말풍선을 버튼보다 위로 이동시키기 위해 Transform 사용
          Transform.translate(
            offset: Offset(0, -screenHeight * 0.03), // 말풍선을 위로 이동
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
              decoration: BoxDecoration(
                color: PRIMARY_COLOR, // 말풍선 배경 색
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                '총 $participants명 인증중', // 총 참여자 수 텍스트
                style: TextStyle(
                  color: Colors.white, // 텍스트 색상
                  fontSize: fontSize * 0.65, // 동적 폰트 사이즈
                ),
              ),
            ),
          ),
          const SizedBox(width: 5.0), // 말풍선과 버튼 사이의 간격 조정
          // 버튼을 말풍선의 오른쪽에 위치
          GestureDetector(
            onTap: () {
              // 전체 사진 조회 페이지로 이동
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FullPhotoGalleryScreen(
                    title: title,
                  ), // 전체 사진 조회 화면
                ),
              );
            },
            child: Container(
              width: screenWidth * 0.1, // 버튼의 너비를 화면 너비의 10%로 설정
              height: screenHeight * 0.05, // 버튼의 높이를 화면 높이의 5%로 설정
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // 원 형태
                color: Colors.white, // 버튼 배경 색
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
                  displayText, // 참여자 수 표시
                  style: TextStyle(
                    color: PRIMARY_COLOR,
                    fontSize: fontSize, // 동적 폰트 사이즈
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
