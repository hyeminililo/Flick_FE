import 'package:flick_frontend/challenge/view/provider/challenge_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/challenge/tile/challengeTile.dart';
import 'package:flick_frontend/challenge/view/detailPage.dart';

class MyChallenge extends ConsumerWidget {
  const MyChallenge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengesAsyncValue = ref.watch(myChallengesProvider);

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
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(child: Text('오류가 발생했습니다.')),
    );
  }
}
