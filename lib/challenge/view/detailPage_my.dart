import 'package:flick_frontend/challenge/camera/provider/cameraControllerNotifier.dart';
import 'package:flick_frontend/challenge/camera/takePictureScreen.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeDetails_provider.dart';
import 'package:flick_frontend/challenge/view/challenge_screen.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailMyChallengePage extends ConsumerWidget {
  final int challengeId;

  const DetailMyChallengePage({super.key, required this.challengeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final challengeAsyncValue =
        ref.watch(challengeDetailsProvider(challengeId));
    final cameraControllerState = ref.watch(cameraControllerNotifierProvider);
    if (cameraControllerState!.value.isInitialized) {
      print("카메라 초기화됨");
    } else {
      print("카메라 해제됨");
    }

    return Scaffold(
      body: challengeAsyncValue.when(
        data: (challenge) {
          if (challenge == null) {
            return const Center(child: Text('챌린지를 찾을 수 없습니다.'));
          }

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  challenge.imageUrl ?? '',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  height: 300,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: (challenge.hashtag ?? []).map((hashtag) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: PRIMARY_COLOR),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
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
                  challenge.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
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
                SizedBox(height: screenHeight * 0.02),
                Text(
                  challenge.contents!,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChallengeScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: PRIMARY_COLOR),
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.115,
                            vertical: screenHeight * 0.023,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "나중에 참여",
                          style: TextStyle(color: PRIMARY_COLOR),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TakePictureScreen(
                                  title: challenge.title,
                                  challengeId: challengeId,
                                ),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('카메라 초기화 실패'),
                              ),
                            );
                          }
                        },
                        // : null,
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: PRIMARY_COLOR),
                          backgroundColor: PRIMARY_COLOR,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.19,
                            vertical: screenHeight * 0.023,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "참여",
                          style: TextStyle(color: SUB_COLOR),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // ref.refresh(challengeDetailsProvider(challengeId));
                },
                child: const Text('재시도'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
