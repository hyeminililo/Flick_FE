import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  final String profileImage;
  const EditProfileScreen({super.key, required this.profileImage});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/images/editMyPage.png",
              width: screenWidth * 0.05,
              height: screenHeight * 0.05,
            ),
            const Text('내 프로필 수정'),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // 화면 너비의 5% 패딩
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: screenWidth * 0.3, // 프로필 사진 크기
                    height: screenWidth * 0.3, // 프로필 사진 크기
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300], // 배경색
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        profileImage, // 기본 프로필 사진
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // 카메라 아이콘
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.camera_alt, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '닉네임',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: '닉네임을 입력하세요',
              ),
            ),
            const Spacer(), // 아래쪽 여백 확보
            Container(
              width: double.infinity, // 버튼이 가득 차게
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03), // 수직 패딩 증가
              child: ElevatedButton(
                onPressed: () {
                  // 저장하기 버튼 클릭 시 행동
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // 배경색
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                    side: const BorderSide(color: Colors.purple), // 테두리 색상
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenHeight * 0.05,
                      vertical: screenWidth * 0.05), // 수평 패딩 증가
                ),
                child: const Text(
                  '저장하기',
                  style: TextStyle(
                      color: Colors.white, fontSize: 18), // 텍스트 색상 및 크기
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
