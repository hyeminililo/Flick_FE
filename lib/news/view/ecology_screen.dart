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
      ),
      body: Column(
        children: [
          // 첫 번째 컨테이너: 랜덤으로 4개의 기사 간단히 보여주는 부분
          newsListAsyncValue.when(
            data: (newsList) {
              final randomNews = (newsList..shuffle()).take(4).toList();
              return Column(
                children: [
                  // PageView 부분
                  SizedBox(
                    height: screenHeight * 0.25, // 화면 높이의 25%로 설정
                    child: PageView.builder(
                      itemCount: randomNews.length,
                      itemBuilder: (context, index) {
                        final newsItem = randomNews[index];

                        return Container(
                          padding: EdgeInsets.all(
                              screenWidth * 0.04), // 화면 너비의 4%로 패딩 설정
                          decoration: BoxDecoration(
                            color: PRIMARY_COLOR,
                            borderRadius:
                                BorderRadius.circular(16), // 모서리 반경 설정
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                newsItem.title ?? '제목 없음',
                                style: TextStyle(
                                    fontSize: screenWidth *
                                        0.045, // 화면 너비의 4.5%로 폰트 크기 설정
                                    fontWeight: FontWeight.bold),
                                overflow:
                                    TextOverflow.ellipsis, // 제목이 길면 잘리도록 설정
                                maxLines: 1, // 최대 줄 수 설정
                              ),
                              const SizedBox(height: 4), // 제목과 내용 간의 간격
                              Text(
                                newsItem.contents ?? '내용 없음',
                                overflow:
                                    TextOverflow.ellipsis, // 내용이 길면 잘리도록 설정
                                maxLines: 2, // 최대 줄 수 설정
                                style: TextStyle(
                                    fontSize: screenWidth *
                                        0.035), // 화면 너비의 3.5%로 폰트 크기 설정
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
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
          ),
          SizedBox(height: screenHeight * 0.015), // 화면 높이의 1.5%로 간격 설정
          const Text(
            "최신 환경뉴스",
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Pretendard",
            ),
          ),
          SizedBox(height: screenHeight * 0.015), // 화면 높이의 1.5%로 간격 설정
          // 두 번째 컨테이너: 전체 뉴스 리스트를 보여주는 부분
          Expanded(
            child: newsListAsyncValue.when(
              data: (newsList) {
                return ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    final news = newsList[index];

                    return ListTile(
                      leading: news.picture != null
                          ? Image.network(news.picture!,
                              width: screenWidth * 0.25, // 화면 너비의 25%로 설정
                              height: screenWidth * 0.25, // 화면 너비의 25%로 설정
                              fit: BoxFit.cover)
                          : const SizedBox(
                              width: 100,
                              height: 100,
                              child: Placeholder(),
                            ),
                      title: Text(news.title ?? '제목 없음'),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.visibility),
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
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
