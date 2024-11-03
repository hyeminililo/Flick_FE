import 'package:flick_frontend/challenge/camera/provider/image_provider.dart';
import 'package:flick_frontend/challenge/provider/challengeMain_provider_real.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FullPhotoGalleryScreen extends ConsumerStatefulWidget {
  final String title;

  const FullPhotoGalleryScreen({super.key, required this.title});

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
    // _loadImagesForSelectedDate(); // 이 부분은 API가 개발되면 호출
  }

  void _generateDateList() {
    dateList.clear(); // 기존 리스트 초기화
    for (int i = -2; i <= 2; i++) {
      dateList.add(selectedDate.add(Duration(days: i)).day);
    }
  }

  void _onDateSelected(int day) {
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
      _generateDateList(); // 날짜 리스트 재생성
      // _loadImagesForSelectedDate(); // 선택된 날짜의 이미지 로드 (API 호출)
    });
  }

  // 신고 모달을 표시하는 메소드
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
                    fontWeight: FontWeight.bold),
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
                      backgroundColor: Colors.grey, // 회색 배경
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // 모달 닫기
                    },
                    child: const Text(
                      '취소',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR, // 기본 색상
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
                      ),
                    ),
                    onPressed: () {
                       final challengeService =
                            ref.read(challengeServiceProvider);

                        await challengeService.challengeReportsRepo.reportsChallenge(imageId: imageId);

                      Navigator.pop(context); // 모달 닫기
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
    final imageUrls = ref.watch(imageProvider); // 이미지 URL 리스트 가져오기
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 기능
          },
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "${widget.title} 인증방",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05, // 동적 폰트 크기
            ),
          ),
        ),
        backgroundColor: PRIMARY_COLOR,
      ),
      body: Container(
        color: PRIMARY_COLOR,
        child: Stack(
          children: [
            // 스크롤 가능한 사진 그리드
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02), // 화면 너비의 2%로 패딩 조정
              child: imageUrls.isEmpty
                  ? const Center(
                      child: Text("이미지가 없습니다."),
                    )
                  : GridView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing:
                            screenWidth * 0.02, // 화면 너비의 2%로 간격 조정
                        mainAxisSpacing: screenWidth * 0.02, // 화면 너비의 2%로 간격 조정
                      ),
                      itemCount: imageUrls.length, // 음 근데 이거 length면 길이로 url이 바뀌는거 아니야 ?
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                imageUrls[index],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                      color: Colors.grey,
                                      child: const Center(
                                        child: Text('이미지 로드 실패'),
                                      ));
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
                                  _showReportModal(context, imageUrls[index]);
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
            // 고정된 날짜 선택 위젯
            Positioned(
              left: screenWidth * 0.05, // 화면 너비의 5%로 위치 조정
              top: screenHeight * 0.1, // 화면 높이의 10%로 위치 조정
              child: Container(
                width: screenWidth * 0.1, // 버튼 너비를 화면 너비의 10%로 설정
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: dateList.map((day) {
                    return GestureDetector(
                      onTap: () => _onDateSelected(day),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: selectedDate.day == day
                              ? PRIMARY_COLOR // 선택된 날짜 강조
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            day.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.04, // 동적 폰트 크기
                                fontWeight: FontWeight.bold),
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



// import 'package:flick_frontend/common/const/colors.dart';
// import 'package:flutter/material.dart';

// class FullPhotoGalleryScreen extends StatefulWidget {
//   final String title;

//   const FullPhotoGalleryScreen({super.key, required this.title});

//   @override
//   _FullPhotoGalleryScreen createState() => _FullPhotoGalleryScreen();
// }

// class _FullPhotoGalleryScreen extends State<FullPhotoGalleryScreen> {
//   DateTime selectedDate = DateTime.now();
//   List<String> imageUrls = []; // 서버에서 받아올 이미지 URL 리스트
//   final List<int> dateList = [];

//   @override
//   void initState() {
//     super.initState();
//     _generateDateList();
//     // _loadImagesForSelectedDate(); // 이 부분은 API가 개발되면 호출
//   }

//   void _generateDateList() {
//     dateList.clear(); // 기존 리스트 초기화
//     for (int i = -2; i <= 2; i++) {
//       dateList.add(selectedDate.add(Duration(days: i)).day);
//     }
//   }

//   void _onDateSelected(int day) {
//     setState(() {
//       selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
//       _generateDateList(); // 날짜 리스트 재생성
//       // _loadImagesForSelectedDate(); // 선택된 날짜의 이미지 로드 (API 호출)
//     });
//   }

//   // 신고 모달을 표시하는 메소드
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
//               const Text(
//                 '이 게시물을 신고하기',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
//                       backgroundColor: Colors.grey, // 회색 배경
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context); // 모달 닫기
//                     },
//                     child: const Text(
//                       '취소',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: PRIMARY_COLOR, // 기본 색상
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
//                       ),
//                     ),
//                     onPressed: () {
//                       // 신고 처리 로직 추가
//                       Navigator.pop(context); // 모달 닫기
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

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.chevron_left,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pop(context); // 뒤로가기 기능
//           },
//         ),
//         title: Container(
//           alignment: Alignment.center,
//           child: Text(
//             "${widget.title} 인증방",
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         backgroundColor: PRIMARY_COLOR,
//       ),
//       body: Container(
//         color: PRIMARY_COLOR,
//         child: Stack(
//           children: [
//             // 스크롤 가능한 사진 그리드
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: imageUrls.isEmpty
//                   ? const Center(
//                       child: Text("이미지가 없습니다."),
//                     )
//                   : GridView.builder(
//                       physics: const AlwaysScrollableScrollPhysics(),
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 8,
//                       ),
//                       itemCount: imageUrls.length, // 이미지 URL 리스트 길이
//                       itemBuilder: (context, index) {
//                         return Stack(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(12.0),
//                               child: Image.network(
//                                 imageUrls[index], // 실제 이미지 URL을 사용하여 이미지 로드
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Container(
//                                       color: Colors.grey, // 오류 발생 시 표시할 색상
//                                       child: const Center(
//                                         child: Text('이미지 로드 실패'),
//                                       ));
//                                 },
//                               ),
//                             ),
//                             Positioned(
//                               right: 8.0,
//                               top: 8.0,
//                               child: IconButton(
//                                 icon: const Icon(Icons.more_horiz,
//                                     color: Colors.white),
//                                 onPressed: () {
//                                   _showReportModal(context, imageUrls[index]);
//                                 },
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//             ),
//             // 고정된 날짜 선택 위젯
//             Positioned(
//               left: screenWidth * 0.05, // 화면 너비의 5%로 위치 조정
//               top: screenHeight * 0.1, // 화면 높이의 10%로 위치 조정
//               child: Container(
//                 width: screenWidth * 0.1, // 버튼 너비를 화면 너비의 10%로 설정
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
//                               ? PRIMARY_COLOR // 선택된 날짜 강조
//                               : Colors.transparent,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Center(
//                           child: Text(
//                             day.toString(),
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
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

// 테스트를 위한 코드임
// 아래에 사진은 더미 데이터. 즉, 임의로 넣은 데이터임.
// 나중에 dev에 합칠 때 주석 없애주세요. from 승창.
// import 'package:flick_frontend/common/const/colors.dart';
// import 'package:flutter/material.dart';

// class FullPhotoGalleryScreen extends StatefulWidget {
//   final String title;

//   const FullPhotoGalleryScreen({super.key, required this.title});

//   @override
//   _FullPhotoGalleryScreen createState() => _FullPhotoGalleryScreen();
// }

// class _FullPhotoGalleryScreen extends State<FullPhotoGalleryScreen> {
//   DateTime selectedDate = DateTime.now();
//   List<String> imageUrls = [
//     "https://via.placeholder.com/300/FF0000/FFFFFF?text=Image+1",
//     "https://via.placeholder.com/300/00FF00/FFFFFF?text=Image+2",
//     "https://via.placeholder.com/300/0000FF/FFFFFF?text=Image+3",
//     "https://via.placeholder.com/300/FFFF00/FFFFFF?text=Image+4",
//     "https://via.placeholder.com/300/FF00FF/FFFFFF?text=Image+5",
//     "https://via.placeholder.com/300/00FFFF/FFFFFF?text=Image+6",
//     "https://via.placeholder.com/300/000000/FFFFFF?text=Image+7",
//     "https://via.placeholder.com/300/FFFFFF/000000?text=Image+8",
//   ]; // 서버에서 받아올 이미지 URL 리스트
//   final List<int> dateList = [];

//   @override
//   void initState() {
//     super.initState();
//     _generateDateList();
//   }

//   void _generateDateList() {
//     dateList.clear(); // 기존 리스트 초기화
//     for (int i = -2; i <= 2; i++) {
//       dateList.add(selectedDate.add(Duration(days: i)).day);
//     }
//   }

//   void _onDateSelected(int day) {
//     setState(() {
//       selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
//       _generateDateList(); // 날짜 리스트 재생성
//     });
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
//               const Text(
//                 '이 게시물을 신고하기',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
//                       backgroundColor: Colors.grey, // 회색 배경
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context); // 모달 닫기
//                     },
//                     child: const Text(
//                       '취소',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: PRIMARY_COLOR, // 기본 색상
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
//                       ),
//                     ),
//                     onPressed: () {
//                       // 신고 처리 로직 추가
//                       Navigator.pop(context); // 모달 닫기
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

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.chevron_left,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pop(context); // 뒤로가기 기능
//           },
//         ),
//         title: Container(
//           alignment: Alignment.center,
//           child: Text(
//             "${widget.title} 인증방",
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         backgroundColor: PRIMARY_COLOR,
//       ),
//       body: Container(
//         color: PRIMARY_COLOR,
//         child: Stack(
//           children: [
//             // 스크롤 가능한 사진 그리드
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: imageUrls.isEmpty
//                   ? const Center(
//                       child: Text("이미지가 없습니다."),
//                     )
//                   : GridView.builder(
//                       physics: const AlwaysScrollableScrollPhysics(),
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 8,
//                       ),
//                       itemCount: imageUrls.length, // 이미지 URL 리스트 길이
//                       itemBuilder: (context, index) {
//                         return Stack(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(12.0),
//                               child: Image.network(
//                                 imageUrls[index], // 실제 이미지 URL을 사용하여 이미지 로드
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Container(
//                                       color: Colors.grey, // 오류 발생 시 표시할 색상
//                                       child: const Center(
//                                         child: Text('이미지 로드 실패'),
//                                       ));
//                                 },
//                               ),
//                             ),
//                             Positioned(
//                               right: 8.0,
//                               top: 8.0,
//                               child: IconButton(
//                                 icon: const Icon(Icons.more_horiz,
//                                     color: Colors.white),
//                                 onPressed: () {
//                                   _showReportModal(context, imageUrls[index]);
//                                 },
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//             ),
//             // 고정된 날짜 선택 위젯
//             Positioned(
//               left: screenWidth * 0.05, // 화면 너비의 5%로 위치 조정
//               top: screenHeight * 0.1, // 화면 높이의 10%로 위치 조정
//               child: Container(
//                 width: screenWidth * 0.1, // 버튼 너비를 화면 너비의 10%로 설정
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
//                               ? PRIMARY_COLOR // 선택된 날짜 강조
//                               : Colors.transparent,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Center(
//                           child: Text(
//                             day.toString(),
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
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
