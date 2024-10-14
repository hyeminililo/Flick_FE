import 'package:camera/camera.dart';
import 'package:flick_frontend/challenge/camera/takePictureScreen.dart';
import 'package:flick_frontend/challenge/view/challenge_screen.dart';
import 'package:flick_frontend/challenge/view/openChallenge.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int challengeId;
  final String title;
  final List<String> hashtags;
  final String contents;
  final String imageUrl;
  final int participants;

  const DetailPage({
    super.key,
    required this.challengeId,
    required this.title,
    required this.hashtags,
    required this.contents,
    required this.imageUrl,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            const SizedBox(height: 20.0),
            Row(
              children: hashtags.map((hashtag) {
                return Container(
                  margin: const EdgeInsets.only(right: 8.0), // 해시태그 간격 조정
                  decoration: BoxDecoration(
                    border: Border.all(color: PRIMARY_COLOR),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0), // 패딩 추가
                  child: Text(
                    hashtag,
                    style: const TextStyle(
                      color: PRIMARY_COLOR,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "나의 챌린지",
              style: TextStyle(
                fontSize: 17.0,
                color: PRIMARY_COLOR,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            //
            const SizedBox(height: 16.0),
            Row(
              children: [
                Image.asset(
                  "assets/images/challengeMembers.png",
                  width: 50,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '$participants명 참가',
                  style: const TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              contents,
              style: const TextStyle(color: Colors.grey, fontSize: 20.0),
            ),
            SizedBox(
              height: screenHeight * 0.28,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChallengeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: PRIMARY_COLOR),
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.135, // 버튼 가로 크기를 동적으로 설정
                      vertical: screenHeight * 0.023, // 버튼 세로 크기를 동적으로 설정
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // 버튼 모서리 둥글기 설정
                    ),
                  ),
                  child: const Text(
                    "나중에 참여",
                    style: TextStyle(color: PRIMARY_COLOR),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TakePictureScreen(
                                  title: title,
                                  challengeId: challengeId,
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: PRIMARY_COLOR),
                    backgroundColor: PRIMARY_COLOR,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.19, // 버튼 가로 크기를 동적으로 설정
                      vertical: screenHeight * 0.023, // 버튼 세로 크기를 동적으로 설정
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // 버튼 모서리 둥글기 설정
                    ),
                  ),
                  child: const Text(
                    "참여",
                    style: TextStyle(color: SUB_COLOR),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
