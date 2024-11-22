// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flick_frontend/common/const/colors.dart';
// import 'package:flick_frontend/news/provider/news_provider.dart';
// import 'package:flick_frontend/news/view/newsDetail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // EcologyScreen 클래스
// class EcologyScreen extends ConsumerWidget {
//   const EcologyScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     // FutureProvider를 구독하여 상태를 가져옴
//     final newsListAsyncValue = ref.watch(newsListProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Flick",
//           style: TextStyle(
//               color: PRIMARY_COLOR,
//               fontFamily: "Pretendard",
//               fontSize: 30.0,
//               fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 20),
//             // 첫 번째 컨테이너: 랜덤으로 4개의 기사 간단히 보여주는 부분
//             newsListAsyncValue.when(
//               data: (newsList) {
//                 final randomNews = (newsList..shuffle()).take(4).toList();
//                 return Column(
//                   children: [
//                     // PageView 부분
//                     SizedBox(
//                       height: screenHeight * 0.2, // 화면 높이의 20%로 설정
//                       child: PageView.builder(
//                         itemCount: randomNews.length,
//                         itemBuilder: (context, index) {
//                           final newsItem = randomNews[index];
//                           return Container(
//                             margin: EdgeInsets.symmetric(horizontal: 20),
//                             padding: EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                               color: PRIMARY_COLOR,
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         newsItem.title ?? '제목 없음',
//                                         style: const TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 1,
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Text(
//                                         newsItem.contents ?? '내용 없음',
//                                         style: const TextStyle(
//                                             fontSize: 14,
//                                             color: Colors.white70),
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 2,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 if (newsItem.picture != null)
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 8.0),
//                                     child: Image.network(
//                                       newsItem.picture!,
//                                       width: 50,
//                                       height: 50,
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     // 페이지 인디케이터 추가
//                     SizedBox(
//                       height: 20,
//                       child: Center(
//                         child: DotsIndicator(
//                           dotsCount: randomNews.length,
//                           decorator: const DotsDecorator(
//                             color: Colors.grey, // 비활성화된 점 색상
//                             activeColor: PRIMARY_COLOR, // 활성화된 점 색상
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//               loading: () => const Center(child: CircularProgressIndicator()),
//               error: (error, stackTrace) =>
//                   Center(child: Text('Error: $error')),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: const Text(
//                 "최신 환경뉴스",
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "Pretendard",
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             // 두 번째 컨테이너: 전체 뉴스 리스트를 보여주는 부분
//             newsListAsyncValue.when(
//               data: (newsList) {
//                 return ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: newsList.length,
//                   itemBuilder: (context, index) {
//                     final news = newsList[index];

//                     return Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8.0, vertical: 8.0),
//                       child: Card(
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16.0),
//                         ),
//                         child: ListTile(
//                           contentPadding: EdgeInsets.all(6),
//                           leading: news.picture != null
//                               ? ClipRRect(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                   child: Image.network(
//                                     news.picture!,
//                                     width: 80,
//                                     height: 100,
//                                     fit: BoxFit.fill,
//                                   ),
//                                 )
//                               : const SizedBox(
//                                   width: 80,
//                                   height: 80,
//                                   child: Placeholder(),
//                                 ),
//                           title: Text(
//                             news.title ?? '제목 없음',
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 2,
//                           ),
//                           subtitle: Row(
//                             children: [
//                               const Icon(Icons.visibility, size: 16),
//                               const SizedBox(width: 5),
//                               Text(news.viewCount.toString() ?? '0'),
//                             ],
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     NewsDetailScreen(newsId: news.newsId),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//               loading: () => const Center(child: CircularProgressIndicator()),
//               error: (error, stackTrace) =>
//                   Center(child: Text('Error: $error')),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 위의 주석 코드는 MediaQuery를 사용하지 않고 UI를 구성하여서
// 아래에 새로 MediaQuery를 사용해 동적인 UI를 구성할 수 있도록 구현했습니다.
// 현재, 제(이승창) 로컬에서는 확인을 할 수 없기에, 추후 dev 통합 테스트시,
// 오버플로우 발생하면 수정하도록 하겠습니다.
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flick_frontend/news/provider/news_provider.dart';
import 'package:flick_frontend/news/view/newsDetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// EcologyScreen 클래스
class EcologyScreen extends ConsumerWidget {
  const EcologyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // FutureProvider를 구독하여 상태를 가져옴
    final newsListAsyncValue = ref.watch(newsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flick",
          style: TextStyle(
              color: PRIMARY_COLOR,
              fontFamily: "Pretendard",
              fontSize: 30.0,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02), // 2% 여백
            // 첫 번째 컨테이너: 랜덤으로 4개의 기사 간단히 보여주는 부분
            newsListAsyncValue.when(
              data: (newsList) {
                final randomNews = (newsList..shuffle()).take(4).toList();
                return Column(
                  children: [
                    // PageView 부분
                    SizedBox(
                      height: screenHeight * 0.2, // 화면 높이의 20%로 설정
                      child: PageView.builder(
                        itemCount: randomNews.length,
                        itemBuilder: (context, index) {
                          final newsItem = randomNews[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05), // 5% 여백
                            padding:
                                EdgeInsets.all(screenWidth * 0.02), // 2% 패딩
                            decoration: BoxDecoration(
                              color: PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        newsItem.title ?? '제목 없음',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        newsItem.contents ?? '내용 없음',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white70),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                if (newsItem.picture != null)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Image.network(
                                      newsItem.picture!,
                                      width: screenWidth * 0.15, // 15% 너비
                                      height: screenHeight * 0.1, // 10% 높이
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // 페이지 인디케이터 추가
                    SizedBox(
                      height: 20,
                      child: Center(
                        child: DotsIndicator(
                          dotsCount: randomNews.length,
                          decorator: const DotsDecorator(
                            color: Colors.grey, // 비활성화된 점 색상
                            activeColor: PRIMARY_COLOR, // 활성화된 점 색상
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
            ),
            SizedBox(height: screenHeight * 0.02), // 2% 여백
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% 여백
              child: const Text(
                "최신 환경뉴스",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pretendard",
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // 2% 여백
            // 두 번째 컨테이너: 전체 뉴스 리스트를 보여주는 부분
            newsListAsyncValue.when(
              data: (newsList) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    final news = newsList[index];

                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenHeight * 0.01), // 2% 가로, 1% 세로 여백
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.all(screenWidth * 0.02), // 2% 패딩
                          leading: news.picture != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    news.picture!,
                                    width: screenWidth * 0.2, // 20% 너비
                                    height: screenHeight * 0.15, // 15% 높이
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : const SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Placeholder(),
                                ),
                          title: Text(
                            news.title ?? '제목 없음',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          subtitle: Row(
                            children: [
                              const Icon(Icons.visibility, size: 16),
                              const SizedBox(width: 5),
                              Text(news.viewCount.toString() ?? '0'),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NewsDetailScreen(newsId: news.newsId),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
            ),
          ],
        ),
      ),
    );
  }
}
