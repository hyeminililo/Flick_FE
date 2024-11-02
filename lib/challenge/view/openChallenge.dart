// import 'package:flick_frontend/challenge/provider/challengeDio_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class OpenChallenge extends ConsumerWidget {
//   const OpenChallenge({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(challengeProvider);

//     return ListView.builder(
//       itemCount: state.challenges.length,
//       itemBuilder: (context, index) {
//         final challenge = state.challenges[index];
//         return ListTile(
//           title: Text(challenge.title),
//           subtitle: Text(challenge.contents ?? ''),
//           trailing: Text('${challenge.joinMembersCount}명 참여'),
//         );
//       },
//     );
//   }
// }
