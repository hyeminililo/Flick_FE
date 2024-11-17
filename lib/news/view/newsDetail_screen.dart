// // import 'package:flick_frontend/news/model/newsResponse_model.dart';
// // import 'package:flutter/material.dart';

// // class NewsDetailScreen extends StatefulWidget {
// //   // 뉴스의 id
// //   final int newsId;

// //   const NewsDetailScreen({super.key, required this.newsId});

// //   @override
// //   State<NewsDetailScreen> createState() => _NewsDetailScreenState();
// // }

// // class _NewsDetailScreenState extends State<NewsDetailScreen> {
// //   late Future<NewsResponse> futureNews;

// //   @override
// //   void initState() {
// //     super.initState();
// //     futureNews = fetchNewsDetail(widget.newsId); // 뉴스 상세 정보를 가져오는 메소드
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('뉴스 상세보기'),
// //       ),
// //       body: FutureBuilder<NewsResponse>(
// //         future: futureNews,
// //         builder: (context, snapshot) {
// //           if (snapshot.hasData) {
// //             final news = snapshot.data!;
// //             return Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Image.network(
// //                     news.picture,
// //                     width: double.infinity,
// //                     height: 200,
// //                     fit: BoxFit.cover,
// //                   ),
// //                   const SizedBox(height: 16),
// //                   Text(
// //                     news.title,
// //                     style: const TextStyle(
// //                         fontSize: 24, fontWeight: FontWeight.bold),
// //                   ),
// //                   const SizedBox(height: 16),
// //                   Text(
// //                     news.contents,
// //                     style: const TextStyle(fontSize: 16),
// //                   ),
// //                   const SizedBox(height: 16),
// //                   Row(
// //                     children: [
// //                       const Icon(Icons.visibility),
// //                       const SizedBox(width: 5),
// //                       Text('${news.viewCount} views'),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             );
// //           } else if (snapshot.hasError) {
// //             return Text('Error: ${snapshot.error}');
// //           }
// //           return const CircularProgressIndicator();
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:flick_frontend/news/provider/newsDetails_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class NewsDetailScreen extends ConsumerWidget {
//   final int newsId;

//   const NewsDetailScreen({super.key, required this.newsId});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final newsAsyncValue = ref.watch(newsDetailsProvider(newsId)); // 오타 수정

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('뉴스 상세보기'),
//       ),
//       body: newsAsyncValue.when(
//         data: (news) {
//           // 성공적으로 데이터 받아왔을 경우
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (news.picture != null)
//                     Image.network(
//                       news.picture!,
//                       width: double.infinity,
//                       height: 200,
//                       fit: BoxFit.cover,
//                     )
//                   else
//                     Container(
//                       width: double.infinity,
//                       height: 200,
//                       color: Colors.grey,
//                       child: const Center(child: Text('이미지가 없습니다.')),
//                     ),
//                   const SizedBox(height: 16),
//                   Text(
//                     news.title,
//                     style: const TextStyle(
//                         fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     news.contents,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     children: [
//                       const Icon(Icons.visibility),
//                       const SizedBox(width: 5),
//                       Text('${news.viewCount ?? 0} views'),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     children: [
//                       const Icon(Icons.thumb_up),
//                       const SizedBox(width: 5),
//                       Text('${news.likeCount ?? 0} likes'),
//                     ],
//                   ),
//                 ],
//               ),
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
//                   ref.refresh(newsDetailsProvider(newsId)); // 재시도 기능
//                 },
//                 child: const Text('재시도'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// // }
// import 'package:flick_frontend/news/provider/newsDetails_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class NewsDetailScreen extends ConsumerWidget {
//   final int newsId;

//   const NewsDetailScreen({super.key, required this.newsId});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // newsDetailsProvider를 통해 데이터 구독
//     final newsAsyncValue = ref.watch(newsDetailsProvider(newsId));

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('뉴스 상세보기'),
//       ),
//       body: newsAsyncValue.when(
//         data: (newsList) {
//           // 리스트에서 첫 번째 아이템을 선택하여 사용 (단일 뉴스 상세 정보)
//           final news = newsList.isNotEmpty ? newsList[0] : null;

//           // 만약 뉴스가 없다면 에러 처리
//           if (news == null) {
//             return const Center(child: Text('뉴스를 찾을 수 없습니다.'));
//           }

//           // 뉴스 상세 UI
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (news.picture != null)
//                   Image.network(
//                     news.picture!,
//                     width: double.infinity,
//                     height: 200,
//                     fit: BoxFit.cover,
//                   )
//                 else
//                   Container(
//                     width: double.infinity,
//                     height: 200,
//                     color: Colors.grey,
//                     child: const Center(child: Text('이미지가 없습니다.')),
//                   ),
//                 const SizedBox(height: 16),
//                 Text(
//                   news.title,
//                   style: const TextStyle(
//                       fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   news.contents,
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     const Icon(Icons.visibility),
//                     const SizedBox(width: 5),
//                     Text('${news.viewCount} views'),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     const Icon(Icons.thumb_up),
//                     const SizedBox(width: 5),
//                     Text('${news.likeCount} likes'),
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
//                   ref.refresh(newsDetailsProvider(newsId)); // 재시도 기능
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
import 'package:flick_frontend/news/provider/newsDetails_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsDetailScreen extends ConsumerWidget {
  final int newsId;

  const NewsDetailScreen({super.key, required this.newsId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // newsDetailsProvider를 통해 데이터 구독
    final newsAsyncValue = ref.watch(newsDetailsProvider(newsId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('뉴스 상세보기'),
      ),
      body: newsAsyncValue.when(
        data: (news) {
          // 단일 뉴스 상세 정보
          if (news == null) {
            return const Center(child: Text('뉴스를 찾을 수 없습니다.'));
          }

          // 뉴스 상세 UI
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (news.picture != null)
                  Image.network(
                    news.picture!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                else
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey,
                    child: const Center(child: Text('이미지가 없습니다.')),
                  ),
                const SizedBox(height: 16),
                Text(
                  news.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  news.contents,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.visibility),
                    const SizedBox(width: 5),
                    Text('${news.viewCount} views'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.thumb_up),
                    const SizedBox(width: 5),
                    Text('${news.likeCount} likes'),
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
                  ref.refresh(newsDetailsProvider(newsId)); // 재시도 기능
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
