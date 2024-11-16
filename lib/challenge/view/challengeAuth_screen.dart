import 'package:flick_frontend/challenge/provider/provs/challengeMy_provider.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChallengeAuthImagesScreen extends ConsumerWidget {
  final String title;
  final int challengeId;
  final DateTime selectedDate;

  const ChallengeAuthImagesScreen({
    super.key,
    required this.title,
    required this.challengeId,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 선택된 날짜에 따라 ChallengeImageParams 생성
    final params = ChallengeImageParams(
      challengeId: challengeId,
      month: selectedDate.month,
      day: selectedDate.day,
    );

    // challengeAuthImagesProvider를 통해 참여자 인증 사진 리스트 가져오기
    final authImagesAsyncValue = ref.watch(challengeAuthImagesProvider(params));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$title 인증 사진",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: PRIMARY_COLOR,
      ),
      body: authImagesAsyncValue.when(
        data: (memberPictureUrls) {
          // 이미지가 없을 때
          if (memberPictureUrls == null ||
              memberPictureUrls.memberPictureUrls.isEmpty) {
            return const Center(child: Text("참여자 인증 사진이 없습니다."));
          }

          // 인증 사진 리스트 표시
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: memberPictureUrls.memberPictureUrls.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        memberPictureUrls.memberPictureUrls[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey,
                            height: 200,
                            child: const Center(
                              child: Text('이미지 로드 실패'),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '참여자 ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('오류 발생: $error'),
        ),
      ),
    );
  }
}
