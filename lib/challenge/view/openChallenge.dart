import 'package:flick_frontend/challenge/provider/provs/challengeOpen_provider.dart';
import 'package:flick_frontend/challenge/view/detailPage_my.dart';
import 'package:flick_frontend/challenge/view/detailPage_open.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/common/const/colors.dart';

class OpenChallenge extends ConsumerWidget {
  const OpenChallenge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengesAsyncValue = ref.watch(openChallengeListProvider);

    return challengesAsyncValue.when(
      data: (challenges) {
        return ListView.builder(
          itemCount: challenges.length,
          itemBuilder: (context, index) {
            final challenge = challenges[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailOpenPage(
                        challengeId: challenge.challengeId,
                      ),
                    ),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0), // 둥근 모서리 추가
                      child: Image.network(
                        challenge.imageUrl ?? '', // 외부 이미지 URL
                        width: MediaQuery.of(context).size.width *
                            0.2, // 화면 너비의 20%
                        height: MediaQuery.of(context).size.width * 0.2,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.error), // 이미지 로드 실패 시 대체 아이콘
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            challenge.title,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            (challenge.hashtag ?? []).join(' '),
                            style: const TextStyle(color: PRIMARY_COLOR),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            children: [
                              Icon(
                                Icons.people, // 사람 아이콘
                                size: MediaQuery.of(context).size.width *
                                    0.06, // 화면 너비의 10%
                                color: Colors.grey, // 아이콘 색상 (원하는 색으로 변경 가능)
                              ),
                              const SizedBox(width: 4.0), // 간격 추가
                              Expanded(
                                child: Text(
                                  '${challenge.joinMembersCount ?? 0}명 참가',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(child: Text('오류가 발생했습니다.')),
    );
  }
}
