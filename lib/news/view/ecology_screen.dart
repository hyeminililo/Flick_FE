import 'package:dio/dio.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flick_frontend/news/model/newsResponse_model.dart';
import 'package:flick_frontend/news/repository/news_repository.dart';
import 'package:flick_frontend/news/view/newsDetail_screen.dart';
import 'package:flutter/material.dart';

class EcologyScreen extends StatefulWidget {
  const EcologyScreen({super.key});

  @override
  State<EcologyScreen> createState() => _EcologyScreenState();
}

class _EcologyScreenState extends State<EcologyScreen> {
  late Future<NewsResponse> futureNews; // News 도메인이 만들어져야 함. 혜민이 코드 받을 것.

  @override
  void initState() {
    super.initState();
    final newsRepository = NewsRepository(Dio());
    futureNews = newsRepository.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
      ),
      body: Column(
        children: [
          // 첫 번째 컨테이너: 랜덤으로 4개의 기사 간단히 보여주는 부분
          FutureBuilder<NewsResponse>(
            future: futureNews,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final randomNews =
                    (snapshot.data!.data!..shuffle()).take(4).toList();
                return Column(
                  children: [
                    // PageView 부분
                    SizedBox(
                      height: 150, // 원하는 높이 설정
                      child: PageView.builder(
                        itemCount: randomNews.length,
                        itemBuilder: (context, index) {
                          final newsItem = randomNews[index];

                          return Container(
                            padding: const EdgeInsets.all(8),
                            // 배경 색상을 제거하여 인디케이터와 충돌 방지
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  newsItem.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(newsItem.contents),
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
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
          SizedBox(height: screenHeight * 0.015),
          const Text("최신 환경뉴스",
              style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Prentendard")),
          SizedBox(height: screenHeight * 0.015),
          // 두 번째 컨테이너: 전체 뉴스 리스트를 보여주는 부분
          Expanded(
            child: FutureBuilder<NewsResponse>(
              future: futureNews,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final newsList = snapshot.data!.data!;

                  return ListView.builder(
                    itemCount: newsList.length, // 리스트의 크기
                    itemBuilder: (context, index) {
                      // itemBuilder가 자동으로 리스트를 순환하며 인덱스 0부터 끝까지 순환함.
                      final news = newsList[index];

                      return ListTile(
                        leading: news.picture != null
                            ? Image.network(news.picture!,
                                width: 100, height: 100, fit: BoxFit.cover)
                            : const SizedBox(
                                width: 100,
                                height: 100,
                                child: Placeholder()), // 이미지 없을 때 Placeholder
                        title: Text(news.title),
                        subtitle: Row(
                          children: [
                            const Icon(Icons.visibility),
                            const SizedBox(width: 5),
                            Text(news.viewCount?.toString() ?? '0'), // 조회수 표시
                          ],
                        ),
                        onTap: () {
                          // GoRouter 사용 시 GoRouter로 수정 가능
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsDetailScreen(
                                        newsId: news.newsId,
                                      )));
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
