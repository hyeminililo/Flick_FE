import 'package:flutter/material.dart';

class ParticipantsAvatarsWidget extends StatelessWidget {
  final List<String> memberPictureUrls;
  final int participantCount;

  const ParticipantsAvatarsWidget({
    super.key,
    required this.memberPictureUrls,
    required this.participantCount,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // 최대 5개의 이미지만 표시
    final displayUrls = memberPictureUrls.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: displayUrls.map((url) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: screenHeight * 0.02), // 이미지 간격을 화면 높이에 비례하여 설정
              child: CircleAvatar(
                radius: screenWidth * 0.05, // 원형 아바타 크기를 화면 너비의 5%로 설정
                backgroundImage: NetworkImage(url), // 이미지 URL로 배경 설정
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Text(
          "참여자 수: $participantCount",
          style: TextStyle(
              fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flick_frontend/challenge/camera/provider/participants_provider.dart';

// // ParticipantsAvatarsWidget: 참여자 아바타와 참여자 수를 표시하는 위젯
// class ParticipantsAvatarsWidget extends ConsumerWidget {
//   final int challengeId;
//   final int month;
//   final int day;

//   const ParticipantsAvatarsWidget({
//     super.key,
//     required this.challengeId,
//     required this.month,
//     required this.day,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // participantsProvider를 통해 참여자 데이터를 가져옴
//     final participantsState = ref.watch(participantsProvider);

//     // 화면 높이 및 너비
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     // // 로딩 상태 처리
//     // if (participantsState is LoadingParticipantsState) {
//     //   return const Center(child: CircularProgressIndicator());
//     // }

//     // // 오류 상태 처리
//     // if (participantsState is ErrorParticipantsState) {
//     //   return Center(child: Text("오류 발생: ${participantsState.error}"));
//     // }

//     // 데이터를 성공적으로 가져온 경우 처리
//     final displayUrls = participantsState.memberPictureUrls.take(5).toList();
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: displayUrls.map((url) {
//             return Padding(
//               padding: EdgeInsets.only(
//                   bottom: screenHeight * 0.02), // 이미지 간격을 화면 높이에 비례하여 설정
//               child: CircleAvatar(
//                 radius: screenWidth * 0.05, // 원형 아바타 크기를 화면 너비의 5%로 설정
//                 backgroundImage: NetworkImage(url), // 이미지 URL로 배경 설정
//               ),
//             );
//           }).toList(),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           "참여자 수: ${participantsState.count}",
//           style: TextStyle(
//               fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }
// }
