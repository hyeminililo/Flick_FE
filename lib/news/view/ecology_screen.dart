import 'package:flick_frontend/common/const/colors.dart';
import 'package:flick_frontend/news/model/newsResponse_model.dart';
import 'package:flick_frontend/news/provider/news_provider.dart';
import 'package:flick_frontend/news/repository/news_service.dart';
import 'package:flick_frontend/news/view/newsDetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// EcologyScreen 클래스
class EcologyScreen extends ConsumerWidget {
  const EcologyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;

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
              return SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: randomNews.length,
                  itemBuilder: (context, index) {
                    final newsItem = randomNews[index];

                    return Container(
                      padding: const EdgeInsets.all(8),
                      color: PRIMARY_COLOR,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            newsItem.title ?? '제목 없음',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(newsItem.contents ?? '내용 없음'),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
          SizedBox(height: screenHeight * 0.015),
          const Text(
            "최신 환경뉴스",
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Pretendard",
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
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
                              width: 100, height: 100, fit: BoxFit.cover)
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
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
          ),
        ],
      ),
    );
  }
}
