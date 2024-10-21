import 'package:flick_frontend/challenge/model/challenge.dart';
import 'package:flick_frontend/challenge/tile/challengeTile.dart';
import 'package:flick_frontend/challenge/view/detailPage.dart';
import 'package:flutter/material.dart';

class MyChallenge extends StatelessWidget {
  const MyChallenge({super.key});

  Future<List<Challenge>> fetchChallenges() async {
    // 여기에 HTTP 요청을 통해 서버에서 데이터를 받아오는 코드를 추가 예정.
    return Future.delayed(const Duration(seconds: 2), () {
      return [
        Challenge(
          challengeId: 1,
          title: '비건 식단 도전하기',
          hashtag: ['#환경식사', '#차근차근', '#식물성음식'],
          contents: '환경을 위한 비건 식단에 도전해보세요!',
          imageUrl: 'assets/images/Error_Image_network.png',
          joinMembersCount: 1516,
        ),
        Challenge(
          challengeId: 2,
          title: '전기 아끼기',
          hashtag: ['#에너지절약', '#전기소비'],
          contents: '전기 절약 챌린지에 참가하세요!',
          imageUrl: 'assets/images/Error_Image_network.png',
          joinMembersCount: 1200,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Challenge>>(
      future: fetchChallenges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('오류가 발생했습니다.'));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final challenge = snapshot.data![index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0), // 상하에 8.0의 패딩 추가
                child: GestureDetector(
                  // GestureDetector 추가
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          challengeId: challenge.challengeId,
                          title: challenge.title,
                          hashtags: challenge.hashtag,
                          contents: challenge.contents,
                          imageUrl: challenge.imageUrl,
                          participants: challenge.joinMembersCount,
                        ),
                      ),
                    );
                  },
                  child: ChallengeTile(
                    title: challenge.title,
                    hashtags: challenge.hashtag,
                    participants: challenge.joinMembersCount,
                    imageUrl: challenge.imageUrl,
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text('데이터가 없습니다.'));
        }
      },
    );
  }
}
