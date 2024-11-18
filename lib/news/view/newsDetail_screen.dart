import 'package:flick_frontend/news/provider/newsDetails_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsDetailScreen extends ConsumerWidget {
  final int newsId;

  const NewsDetailScreen({super.key, required this.newsId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsyncValue = ref.watch(newsDetailsProvider(newsId));

    // MediaQuery를 사용하여 화면 크기 정보 가져오기
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('뉴스 상세보기'),
      ),
      body: newsAsyncValue.when(
        data: (news) {
          if (news == null) {
            return const Center(child: Text('뉴스를 찾을 수 없습니다.'));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(screenSize.width * 0.04), // 동적으로 패딩 설정
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (news.picture != null)
                  Image.network(
                    news.picture!,
                    width: double.infinity,
                    height: screenSize.height * 0.25, // 동적으로 높이 설정
                    fit: BoxFit.cover,
                  )
                else
                  Container(
                    width: double.infinity,
                    height: screenSize.height * 0.25, // 동적으로 높이 설정
                    color: Colors.grey,
                    child: const Center(child: Text('이미지가 없습니다.')),
                  ),
                const SizedBox(height: 16),
                Text(
                  news.title,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.06, // 동적으로 폰트 크기 설정
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  news.contents,
                  style: TextStyle(
                      fontSize: screenSize.width * 0.045), // 동적으로 폰트 크기 설정
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
