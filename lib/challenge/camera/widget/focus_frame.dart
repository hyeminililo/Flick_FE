import 'package:flutter/material.dart';

class FocusFrameWidget extends StatelessWidget {
  const FocusFrameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery를 사용하여 화면의 높이와 너비를 가져옵니다.
    final screenWidth = MediaQuery.of(context).size.width;

    // 프레임의 크기를 화면 크기에 비례하여 설정합니다.
    final frameSize = screenWidth * 0.5; // 화면 너비의 50%로 설정

    return Center(
      child: Container(
        width: frameSize,
        height: frameSize,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(Icons.add,
            size: frameSize * 0.25,
            color: Colors.white.withOpacity(0.5)), // 아이콘 크기도 비례 설정
      ),
    );
  }
}
