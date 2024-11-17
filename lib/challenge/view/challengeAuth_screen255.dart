// import 'package:flick_frontend/challenge/provider/provs/challengeMy_provider.dart';
// import 'package:flick_frontend/common/const/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ChallengeAuthImagesScreen extends ConsumerStatefulWidget {
//   final String title;
//   final int challengeId;
//   final DateTime selectedDate;

//   const ChallengeAuthImagesScreen({
//     super.key,
//     required this.title,
//     required this.challengeId,
//     required this.selectedDate,
//   });

//   @override
//   ConsumerState<ChallengeAuthImagesScreen> createState() =>
//       _ChallengeAuthImagesScreenState();
// }

// class _ChallengeAuthImagesScreenState
//     extends ConsumerState<ChallengeAuthImagesScreen> {
//   late DateTime selectedDate;
//   late List<int> dateList;
//   bool isLoading = false;
//   String? errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     selectedDate = widget.selectedDate;
//     _generateDateList();
//   }

//   void _generateDateList() {
//     dateList = [];
//     for (int i = -2; i <= 2; i++) {
//       dateList.add(selectedDate.add(Duration(days: i)).day);
//     }
//   }

//   void _onDateSelected(int day) {
//     setState(() {
//       selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
//       _generateDateList();
//       isLoading = true;
//       errorMessage = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // selectedDate에 따라 provider를 동적으로 호출
//     final params = ChallengeImageParams(
//       challengeId: widget.challengeId,
//       month: selectedDate.month,
//       day: selectedDate.day,
//     );

//     ref.listen<AsyncValue>(
//       challengeAuthImagesProvider(params),
//       (previous, next) {
//         next.when(
//           data: (data) {
//             setState(() {
//               isLoading = false;
//               if (data == null || data.memberPictureUrls.isEmpty) {
//                 errorMessage = "참여자 인증 사진이 없습니다.";
//               }
//             });
//           },
//           loading: () {
//             setState(() {
//               isLoading = true;
//             });
//           },
//           error: (error, stackTrace) {
//             setState(() {
//               isLoading = false;
//               errorMessage = "데이터 로드 중 오류 발생: $error";
//             });
//           },
//         );
//       },
//     );

//     final authImagesAsyncValue = ref.watch(challengeAuthImagesProvider(params));

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "${widget.title} 인증 사진",
//           style: const TextStyle(color: Colors.white),
//         ),
//         backgroundColor: PRIMARY_COLOR,
//       ),
//       body: Stack(
//         children: [
//           authImagesAsyncValue.when(
//             data: (memberPictureUrls) {
//               if (memberPictureUrls == null ||
//                   memberPictureUrls.memberPictureUrls.isEmpty) {
//                 return const Center(child: Text("참여자 인증 사진이 없습니다."));
//               }
//               return ListView.builder(
//                 padding: const EdgeInsets.all(8.0),
//                 itemCount: memberPictureUrls.memberPictureUrls.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     margin: const EdgeInsets.symmetric(vertical: 8.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Column(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(10.0),
//                           child: Image.network(
//                             memberPictureUrls.memberPictureUrls[index],
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) {
//                               return Container(
//                                 color: Colors.grey,
//                                 height: 200,
//                                 child: const Center(
//                                   child: Text('이미지 로드 실패'),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             '참여자 ${index + 1}',
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//             loading: () => isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : Container(),
//             error: (error, stackTrace) => Center(
//               child: Text(errorMessage ?? '오류 발생: $error'),
//             ),
//           ),
//           // 날짜 선택 위젯
//           Positioned(
//             left: MediaQuery.of(context).size.width * 0.05,
//             top: MediaQuery.of(context).size.height * 0.1,
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.1,
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: dateList.map((day) {
//                   return GestureDetector(
//                     onTap: () => _onDateSelected(day),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                       decoration: BoxDecoration(
//                         color: selectedDate.day == day
//                             ? PRIMARY_COLOR
//                             : Colors.transparent,
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Center(
//                         child: Text(
//                           day.toString(),
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: MediaQuery.of(context).size.width * 0.04,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
