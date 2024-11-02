// class Challenge {
//   final int challengeId;
//   final String title;
//   final List<String> hashtag;
//   final String contents;
//   final String imageUrl;
//   final int joinMembersCount;

//   Challenge({
//     required this.challengeId,
//     required this.title,
//     required this.hashtag,
//     required this.contents,
//     required this.imageUrl,
//     required this.joinMembersCount,
//   });

//   factory Challenge.fromJson(Map<String, dynamic> json) {
//     return Challenge(
//       challengeId: json['challengeId'],
//       title: json['title'],
//       hashtag: List<String>.from(json['hashtag']),
//       contents: json['contents'],
//       imageUrl: json['imageUrl'],
//       joinMembersCount: json['joinMembersCount'],
//     );
//   }
// }
