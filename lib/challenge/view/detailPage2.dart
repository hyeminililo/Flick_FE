import 'package:flick_frontend/challenge/camera/takePictureScreen.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeDetails_provider.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeMain_provider_real.dart';
import 'package:flick_frontend/challenge/view/%08challengeAuth_screen.dart';
import 'package:flick_frontend/challenge/view/challenge_screen2.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flick_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class DetailPage extends ConsumerWidget {
//   final int challengeId;

//   const DetailPage({super.key, required this.challengeId});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     final challengeAsyncValue =
//         ref.watch(challengeDetailsProvider(challengeId));

//     return Scaffold(
//       body: challengeAsyncValue.when(
//         data: (challenge) {
//           if (challenge == null) {
//             return const Center(child: Text('챌린지를 찾을 수 없습니다.'));
//           }

//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.network(
//                   challenge.imageUrl ?? '',
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   height: 300,
//                   errorBuilder: (context, error, stackTrace) =>
//                       Icon(Icons.error),
//                 ),
//                 const SizedBox(height: 20.0),
//                 Row(
//                   children: (challenge.hashtag ?? []).map((hashtag) {
//                     return Container(
//                       margin: const EdgeInsets.only(right: 8.0),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: PRIMARY_COLOR),
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8.0, vertical: 4.0),
//                       child: Text(
//                         hashtag,
//                         style: const TextStyle(
//                           color: PRIMARY_COLOR,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 const SizedBox(height: 16.0),
//                 const Text(
//                   "나의 챌린지",
//                   style: TextStyle(
//                     fontSize: 17.0,
//                     color: PRIMARY_COLOR,
//                   ),
//                 ),
//                 const SizedBox(height: 12.0),
//                 Text(
//                   challenge.title,
//                   style: const TextStyle(
//                       fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 16.0),
//                 // Row(
//                 //   children: [
//                 //     Image.network(
//                 //       challenge.imageUrl ?? '',
//                 //       width: 50,
//                 //       errorBuilder: (context, error, stackTrace) =>
//                 //           Icon(Icons.error),
//                 //     ),
//                 //     const SizedBox(width: 10.0),
//                 //     Text(
//                 //       '${challenge.joinMembersCount}명 참가',
//                 //       style:
//                 //           const TextStyle(color: Colors.black, fontSize: 16.0),
//                 //     ),
//                 //   ],
//                 // ),
//                 // const SizedBox(height: 8.0),
//                 // Text(
//                 //   challenge.contents!,
//                 //   style: const TextStyle(color: Colors.grey, fontSize: 20.0),
//                 // ),
//                 // SizedBox(height: screenHeight * 0.20),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const ChallengeScreen(),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         side: const BorderSide(color: PRIMARY_COLOR),
//                         backgroundColor: Colors.white,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: screenWidth * 0.115,
//                           vertical: screenHeight * 0.023,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                       child: const Text(
//                         "나중에 참여",
//                         style: TextStyle(color: PRIMARY_COLOR),
//                       ),
//                     ),
//                     SizedBox(width: screenWidth * 0.03),
//                     ElevatedButton(
//                       onPressed: () async {
//                         final challengeService =
//                             ref.read(challengeServiceProvider);
// // 여기서 디테일 페이지가 오픈 챌린지라면 join없어도 될듯?
//                         await challengeService.joinChallenge(challengeId);

//                         final cameraController = ref.read(cameraProvider);

//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => TakePictureScreen(
//                               title: challenge.title,
//                               challengeId: challengeId,
//                               cameraController: cameraController,
//                             ),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         side: const BorderSide(color: PRIMARY_COLOR),
//                         backgroundColor: PRIMARY_COLOR,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: screenWidth * 0.19,
//                           vertical: screenHeight * 0.023,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                       child: const Text(
//                         "참여",
//                         style: TextStyle(color: SUB_COLOR),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (error, stack) => Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Error: $error'),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   ref.refresh(challengeDetailsProvider(challengeId));
//                 },
//                 child: const Text('재시도'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class DetailPage extends ConsumerWidget {
  final int challengeId;

  const DetailPage({super.key, required this.challengeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final challengeAsyncValue =
        ref.watch(challengeDetailsProvider(challengeId));

    return Scaffold(
      body: challengeAsyncValue.when(
        data: (challenge) {
          if (challenge == null) {
            return const Center(child: Text('챌린지를 찾을 수 없습니다.'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  challenge.imageUrl ?? '',
                  fit: BoxFit.cover,
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
                const SizedBox(height: 16.0),
                Row(
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
                        final challengeService =
                            ref.read(challengeServiceProvider);

                        await challengeService.joinChallenge(challengeId);

                        final cameraController = ref.read(cameraProvider);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TakePictureScreen(
                              title: challenge.title,
                              challengeId: challengeId,
                              cameraController: cameraController,
                            ),
                          ),
                        );
                      },
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
                  ref.refresh(challengeDetailsProvider(challengeId));
                },
                child: const Text('재시도'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          final DateTime selectedDate = DateTime.now();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChallengeAuthImagesScreen(
                title: '참여자 인증 사진',
                challengeId: challengeId,
                selectedDate: selectedDate,
              ),
            ),
          );
        },
        child: const Icon(Icons.photo_library, color: Colors.white),
      ),
    );
  }
}
