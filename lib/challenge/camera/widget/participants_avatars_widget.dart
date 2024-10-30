import 'package:flutter/material.dart';

class ParticipantsAvatarsWidget extends StatelessWidget {
  final List<String> memberPictureUrls; // 서버에서 받아온 프로필 이미지 URL 리스트

  const ParticipantsAvatarsWidget({
    super.key,
    required this.memberPictureUrls,
  });

  @override
  Widget build(BuildContext context) {
    // 최대 5개의 이미지만 표시
    final displayUrls = memberPictureUrls.take(5).toList();
    final screenHeight = MediaQuery.of(context).size.height; // 화면 높이
    final screenWidth = MediaQuery.of(context).size.width; // 화면 너비

    return Column(
      children: displayUrls.map((url) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: screenHeight * 0.02), // 이미지 간격을 화면 높이에 비례하여 설정
          child: CircleAvatar(
            radius: screenWidth * 0.05, // 원형 아바타 크기를 화면 너비의 10%로 설정
            backgroundImage: NetworkImage(url), // 이미지 URL로 배경 설정
          ),
        );
      }).toList(),
    );
  }
}
