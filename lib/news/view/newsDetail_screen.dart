// import 'package:flick_frontend/news/model/newsResponse_model.dart';
// import 'package:flutter/material.dart';

// class NewsDetailScreen extends StatefulWidget {
//   // 뉴스의 id
//   final int newsId;

//   const NewsDetailScreen({super.key, required this.newsId});

//   @override
//   State<NewsDetailScreen> createState() => _NewsDetailScreenState();
// }

// class _NewsDetailScreenState extends State<NewsDetailScreen> {
//   late Future<NewsResponse> futureNews;

//   @override
//   void initState() {
//     super.initState();
//     futureNews = fetchNewsDetail(widget.newsId); // 뉴스 상세 정보를 가져오는 메소드
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('뉴스 상세보기'),
//       ),
//       body: FutureBuilder<NewsResponse>(
//         future: futureNews,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final news = snapshot.data!;
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Image.network(
//                     news.picture,
//                     width: double.infinity,
//                     height: 200,
//                     fit: BoxFit.cover,
//                   ),
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
//                       Text('${news.viewCount} views'),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           return const CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }

import 'package:dio/dio.dart';
import 'package:flick_frontend/news/model/newsInfo_model.dart'; // NewsInfo 모델 사용
import 'package:flick_frontend/news/repository/news_repository.dart';
import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  // 뉴스의 id
  final int newsId;

  const NewsDetailScreen({super.key, required this.newsId});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  late Future<NewsInfo> futureNews; // 수정: NewsInfo 타입으로 변경
  late NewsRepository newsRepository; // NewsRepository 선언

  @override
  void initState() {
    super.initState();
    // Dio 인스턴스를 생성하고 NewsRepository에 주입
    Dio dio = Dio();
    newsRepository = NewsRepository(dio); // 리포지토리 생성

    // newsRepository를 사용하여 fetchNewsDetails 호출
    futureNews = newsRepository.fetchNewsDetails(widget.newsId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('뉴스 상세보기'),
      ),
      body: FutureBuilder<NewsInfo>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final news = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 뉴스 이미지
                    if (news.picture != null)
                      Image.network(
                        news.picture!,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(height: 16),
                    // 뉴스 제목
                    Text(
                      news.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    // 뉴스 본문
                    Text(
                      news.contents,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    // 조회수 및 기타 정보
                    Row(
                      children: [
                        const Icon(Icons.visibility),
                        const SizedBox(width: 5),
                        Text('${news.viewCount ?? 0} views'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.thumb_up),
                        const SizedBox(width: 5),
                        Text('${news.likeCount ?? 0} likes'),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
