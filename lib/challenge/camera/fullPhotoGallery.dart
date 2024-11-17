// import 'package:flick_frontend/challenge/camera/provider/image_provider.dart';
// import 'package:flick_frontend/challenge/provider/provs/challengeMy_provider.dart';
// import 'package:flick_frontend/common/const/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // 여기부터 : 받아지는게 안 보여짐
// class FullPhotoGalleryScreen extends ConsumerStatefulWidget {
//   final String title;
//   final int challengeId;

//   const FullPhotoGalleryScreen({
//     super.key,
//     required this.title,
//     required this.challengeId,
//   });

//   @override
//   _FullPhotoGalleryScreen createState() => _FullPhotoGalleryScreen();
// }

// class _FullPhotoGalleryScreen extends ConsumerState<FullPhotoGalleryScreen> {
//   DateTime selectedDate = DateTime.now();
//   final List<int> dateList = [];

//   @override
//   void initState() {
//     super.initState();
//     _generateDateList();
//   }

//   void _generateDateList() {
//     dateList.clear();
//     for (int i = -2; i <= 2; i++) {
//       dateList.add(selectedDate.add(Duration(days: i)).day);
//     }
//   }

//   // void _onDateSelected(int day) {
//   //   setState(() {
//   //     selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
//   //     _generateDateList();
//   //   });
//   //   // 날짜 선택 시 provider 새로고침
//   //   ref.refresh(challengeImagesProvider(ChallengeImageParams(
//   //     challengeId: widget.challengeId,
//   //     month: selectedDate.month,
//   //     day: selectedDate.day,
//   //   )));
//   // }
//   // void _onDateSelected(int day) {
//   //   setState(() {
//   //     selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
//   //     _generateDateList();
//   //   });

//   //   // 새로고침된 provider 값을 사용
//   //   final refreshedProvider = ref.refresh(challengeImagesProvider(
//   //     ChallengeImageParams(
//   //       challengeId: widget.challengeId,
//   //       month: selectedDate.month,
//   //       day: selectedDate.day,
//   //     ),
//   //   ));
//   // }
//   void _onDateSelected(int day) {
//     setState(() {
//       selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
//       _generateDateList();
//     });

//     ref.refresh(challengeImagesProvider(
//       ChallengeImageParams(
//         challengeId: widget.challengeId,
//         month: selectedDate.month,
//         day: selectedDate.day,
//       ),
//     ));
//   }

//   void _showReportModal(BuildContext context, String imageUrl) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.all(16.0),
//           color: Colors.white,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 '이 게시물을 신고하기',
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.width * 0.05,
//                     fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 '게시물의 내용이 부적절하다고 느낄 때 신고해주세요.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       '취소',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: PRIMARY_COLOR,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     onPressed: () {
//                       // 신고 로직 추가
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       '확인',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   final params = ChallengeImageParams(
//   //     challengeId: widget.challengeId,
//   //     month: selectedDate.month,
//   //     day: selectedDate.day,
//   //   );

//   //   final imageUrlsAsyncValue = ref.watch(challengeImagesProvider(params));
//   //   final screenHeight = MediaQuery.of(context).size.height;
//   //   final screenWidth = MediaQuery.of(context).size.width;

//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       leading: IconButton(
//   //         icon: const Icon(
//   //           Icons.chevron_left,
//   //           color: Colors.white,
//   //         ),
//   //         onPressed: () {
//   //           Navigator.pop(context);
//   //         },
//   //       ),
//   //       title: Center(
//   //         child: Text(
//   //           "${widget.title} 인증방",
//   //           textAlign: TextAlign.center,
//   //           style: TextStyle(
//   //             color: Colors.white,
//   //             fontWeight: FontWeight.bold,
//   //             fontSize: screenWidth * 0.05,
//   //           ),
//   //         ),
//   //       ),
//   //       backgroundColor: PRIMARY_COLOR,
//   //     ),
//   //     body: Container(
//   //       color: PRIMARY_COLOR,
//   //       child: Stack(
//   //         children: [
//   //           imageUrlsAsyncValue.when(
//   //             data: (imageUrls) {
//   //               if (imageUrls == null || imageUrls.imageUrls.isEmpty) {
//   //                 return const Center(child: Text("이미지가 없습니다."));
//   //               } else {
//   //                 return Padding(
//   //                   padding: EdgeInsets.all(screenWidth * 0.02),
//   //                   child: GridView.builder(
//   //                     physics: const AlwaysScrollableScrollPhysics(),
//   //                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//   //                       crossAxisCount: 2,
//   //                       crossAxisSpacing: screenWidth * 0.02,
//   //                       mainAxisSpacing: screenWidth * 0.02,
//   //                     ),
//   //                     itemCount: imageUrls.imageUrls.length,
//   //                     itemBuilder: (context, index) {
//   //                       return Stack(
//   //                         children: [
//   //                           ClipRRect(
//   //                             borderRadius: BorderRadius.circular(12.0),
//   //                             child: Image.network(
//   //                               imageUrls.imageUrls[index],
//   //                               fit: BoxFit.cover,
//   //                               errorBuilder: (context, error, stackTrace) {
//   //                                 return Container(
//   //                                   color: Colors.grey,
//   //                                   child: const Center(
//   //                                     child: Text('이미지 로드 실패'),
//   //                                   ),
//   //                                 );
//   //                               },
//   //                             ),
//   //                           ),
//   //                           Positioned(
//   //                             right: 8.0,
//   //                             top: 8.0,
//   //                             child: IconButton(
//   //                               icon: const Icon(Icons.more_horiz,
//   //                                   color: Colors.white),
//   //                               onPressed: () {
//   //                                 _showReportModal(
//   //                                     context, imageUrls.imageUrls[index]);
//   //                               },
//   //                             ),
//   //                           ),
//   //                         ],
//   //                       );
//   //                     },
//   //                   ),
//   //                 );
//   //               }
//   //             },
//   //             loading: () => const Center(child: CircularProgressIndicator()),
//   //             error: (error, stack) => Center(child: Text("오류 발생: $error")),
//   //           ),

//   //           // imageUrlsAsyncValue.when(
//   //           //   data: (imageUrls) => imageUrls == null ||
//   //           //           imageUrls.imageUrls.isEmpty
//   //           //       ? const Center(child: Text("이미지가 없습니다."))
//   //           //       : Padding(
//   //           //           padding: EdgeInsets.all(screenWidth * 0.02),
//   //           //           child: GridView.builder(
//   //           //             physics: const AlwaysScrollableScrollPhysics(),
//   //           //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//   //           //               crossAxisCount: 2,
//   //           //               crossAxisSpacing: screenWidth * 0.02,
//   //           //               mainAxisSpacing: screenWidth * 0.02,
//   //           //             ),
//   //           //             itemCount: imageUrls.imageUrls.length,
//   //           //             itemBuilder: (context, index) {
//   //           //               return Stack(
//   //           //                 children: [
//   //           //                   ClipRRect(
//   //           //                     borderRadius: BorderRadius.circular(12.0),
//   //           //                     child: Image.network(
//   //           //                       imageUrls.imageUrls[index],
//   //           //                       fit: BoxFit.cover,
//   //           //                       errorBuilder: (context, error, stackTrace) {
//   //           //                         return Container(
//   //           //                           color: Colors.grey,
//   //           //                           child: const Center(
//   //           //                             child: Text('이미지 로드 실패'),
//   //           //                           ),
//   //           //                         );
//   //           //                       },
//   //           //                     ),
//   //           //                   ),
//   //           //                   Positioned(
//   //           //                     right: 8.0,
//   //           //                     top: 8.0,
//   //           //                     child: IconButton(
//   //           //                       icon: const Icon(Icons.more_horiz,
//   //           //                           color: Colors.white),
//   //           //                       onPressed: () {
//   //           //                         _showReportModal(
//   //           //                             context, imageUrls.imageUrls[index]);
//   //           //                       },
//   //           //                     ),
//   //           //                   ),
//   //           //                 ],
//   //           //               );
//   //           //             },
//   //           //           ),
//   //           //         ),
//   //           //   loading: () => const Center(child: CircularProgressIndicator()),
//   //           //   error: (error, stack) => Center(child: Text("오류 발생: $error")),
//   //           // ),
//   //           Positioned(
//   //             left: screenWidth * 0.05,
//   //             top: screenHeight * 0.1,
//   //             child: Container(
//   //               width: screenWidth * 0.1,
//   //               decoration: BoxDecoration(
//   //                 color: Colors.black.withOpacity(0.5),
//   //                 borderRadius: BorderRadius.circular(12.0),
//   //               ),
//   //               child: Column(
//   //                 mainAxisSize: MainAxisSize.min,
//   //                 children: dateList.map((day) {
//   //                   return GestureDetector(
//   //                     onTap: () => _onDateSelected(day),
//   //                     child: Container(
//   //                       padding: const EdgeInsets.symmetric(vertical: 8),
//   //                       decoration: BoxDecoration(
//   //                         color: selectedDate.day == day
//   //                             ? PRIMARY_COLOR
//   //                             : Colors.transparent,
//   //                         borderRadius: BorderRadius.circular(8.0),
//   //                       ),
//   //                       child: Center(
//   //                         child: Text(
//   //                           day.toString(),
//   //                           style: TextStyle(
//   //                             color: Colors.white,
//   //                             fontSize: screenWidth * 0.04,
//   //                             fontWeight: FontWeight.bold,
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   );
//   //                 }).toList(),
//   //               ),
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // } // Main widget의 build 함수 안
//   @override
//   Widget build(BuildContext context) {
//     final params = ChallengeImageParams(
//       challengeId: widget.challengeId,
//       month: selectedDate.month,
//       day: selectedDate.day,
//     );

//     // Provider의 현재 상태 감시
//     final imageUrlsAsyncValue = ref.watch(challengeImagesProvider(params));

//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.chevron_left, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Center(
//           child: Text(
//             "${widget.title} 인증방",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: screenWidth * 0.05,
//             ),
//           ),
//         ),
//         backgroundColor: PRIMARY_COLOR,
//       ),
//       body: Container(
//         color: PRIMARY_COLOR,
//         child: Stack(
//           children: [
//             // 이미지 상태에 따른 UI 처리
//             imageUrlsAsyncValue.when(
//               data: (imageUrls) {
//                 if (imageUrls == null || imageUrls.imageUrls.isEmpty) {
//                   return const Center(child: Text("이미지가 없습니다."));
//                 }
//                 return Padding(
//                   padding: EdgeInsets.all(screenWidth * 0.02),
//                   child: GridView.builder(
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: screenWidth * 0.02,
//                       mainAxisSpacing: screenWidth * 0.02,
//                     ),
//                     itemCount: imageUrls.imageUrls.length,
//                     itemBuilder: (context, index) {
//                       return Stack(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(12.0),
//                             child: Image.network(
//                               imageUrls.imageUrls[index],
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) {
//                                 return Container(
//                                   color: Colors.grey,
//                                   child: const Center(
//                                     child: Text('이미지 로드 실패'),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                           Positioned(
//                             right: 8.0,
//                             top: 8.0,
//                             child: IconButton(
//                               icon: const Icon(Icons.more_horiz,
//                                   color: Colors.white),
//                               onPressed: () {
//                                 _showReportModal(
//                                     context, imageUrls.imageUrls[index]);
//                               },
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 );
//               },
//               loading: () => const Center(child: CircularProgressIndicator()),
//               error: (error, stack) => Center(child: Text("오류 발생: $error")),
//             ),
//             // 날짜 선택 위젯
//             Positioned(
//               left: screenWidth * 0.05,
//               top: screenHeight * 0.1,
//               child: Container(
//                 width: screenWidth * 0.1,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: dateList.map((day) {
//                     return GestureDetector(
//                       onTap: () => _onDateSelected(day),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                         decoration: BoxDecoration(
//                           color: selectedDate.day == day
//                               ? PRIMARY_COLOR
//                               : Colors.transparent,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Center(
//                           child: Text(
//                             day.toString(),
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: screenWidth * 0.04,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// //     );
// //   }
// // }
import 'package:flick_frontend/challenge/provider/provs/challengeMy_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/challenge/camera/provider/image_provider.dart';
import 'package:flick_frontend/common/const/colors.dart';

class FullPhotoGalleryScreen extends ConsumerStatefulWidget {
  final String title;
  final int challengeId;

  const FullPhotoGalleryScreen({
    super.key,
    required this.title,
    required this.challengeId,
  });

  @override
  _FullPhotoGalleryScreen createState() => _FullPhotoGalleryScreen();
}

class _FullPhotoGalleryScreen extends ConsumerState<FullPhotoGalleryScreen> {
  DateTime selectedDate = DateTime.now();
  final List<int> dateList = [];

  @override
  void initState() {
    super.initState();
    _generateDateList();
  }

  void _generateDateList() {
    dateList.clear();
    for (int i = -2; i <= 2; i++) {
      dateList.add(selectedDate.add(Duration(days: i)).day);
    }
  }

  void _onDateSelected(int day) {
    if (selectedDate.day != day) {
      setState(() {
        selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
        _generateDateList();
      });

      // 날짜에 맞는 데이터를 다시 가져오기
      ref.invalidate(challengeImagesProvider(
        ChallengeImageParams(
          challengeId: widget.challengeId,
          month: selectedDate.month,
          day: selectedDate.day,
        ),
      ));
    }
  }

  void _showReportModal(BuildContext context, String imageUrl) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '이 게시물을 신고하기',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '게시물의 내용이 부적절하다고 느낄 때 신고해주세요.',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      '취소',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      // 신고 로직 추가
                      Navigator.pop(context);
                    },
                    child: const Text(
                      '확인',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final params = ChallengeImageParams(
      challengeId: widget.challengeId,
      month: selectedDate.month,
      day: selectedDate.day,
    );

    final imageUrlsAsyncValue = ref.watch(challengeImagesProvider(params));

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            "${widget.title} 인증방",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05,
            ),
          ),
        ),
        backgroundColor: PRIMARY_COLOR,
      ),
      body: Container(
        color: PRIMARY_COLOR,
        child: Stack(
          children: [
            imageUrlsAsyncValue.when(
              data: (imageUrls) {
                if (imageUrls == null || imageUrls.imageUrls.isEmpty) {
                  return const Center(
                    child: Text(
                      "이미지가 없습니다.",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Stack(
                    children: [
                      GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: screenWidth * 0.02,
                          mainAxisSpacing: screenWidth * 0.02,
                        ),
                        itemCount: imageUrls.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  imageUrls.imageUrls[index],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey,
                                      child: const Center(
                                        child: Icon(Icons.broken_image,
                                            color: Colors.white, size: 40),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                right: 8.0,
                                top: 8.0,
                                child: IconButton(
                                  icon: const Icon(Icons.more_horiz,
                                      color: Colors.white),
                                  onPressed: () {
                                    _showReportModal(
                                        context, imageUrls.imageUrls[index]);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      if (imageUrlsAsyncValue.isLoading)
                        const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                    ],
                  ),
                );
              },
              loading: () => const Center(
                  child: CircularProgressIndicator(color: Colors.white)),
              error: (error, stack) => Center(
                child: Text(
                  "오류 발생: $error",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.05,
              top: screenHeight * 0.1,
              child: Container(
                width: screenWidth * 0.1,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: dateList.map((day) {
                    return GestureDetector(
                      onTap: () => _onDateSelected(day),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: selectedDate.day == day
                              ? PRIMARY_COLOR
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                          border: selectedDate.day == day
                              ? Border.all(color: Colors.white)
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            day.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
