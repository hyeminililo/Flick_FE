import 'package:flick_frontend/common/const/colors.dart';
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

    return SafeArea(
      child: Scaffold(
        body: newsAsyncValue.when(
          data: (news) {
            if (news == null) {
              return const Center(child: Text('뉴스를 찾을 수 없습니다.'));
            }

            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (news.picture != null)
                        Image.network(
                          news.picture!,
                          width: double.infinity,
                          height: screenSize.height * 0.4, // 동적으로 높이 설정
                          fit: BoxFit.fill,
                        )
                      else
                        Container(
                          width: double.infinity,
                          height: screenSize.height * 0.4, // 동적으로 높이 설정
                          color: Colors.grey,
                          child: const Center(child: Text('이미지가 없습니다.')),
                        ),
                      Padding(
                        padding:
                            EdgeInsets.all(screenSize.width * 0.04), // 동적 패딩
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: screenSize.height * 0.005, // 동적 세로 패딩
                                horizontal: screenSize.width * 0.03, // 동적 가로 패딩
                              ),
                              decoration: BoxDecoration(
                                color: PRIMARY_COLOR, // 배경색
                                borderRadius:
                                    BorderRadius.circular(15), // 둥근 모서리
                              ),
                              child: Text(
                                '환경뉴스',
                                style: TextStyle(
                                  fontSize:
                                      screenSize.width * 0.04, // 동적 텍스트 크기
                                  fontWeight: FontWeight.bold, // 텍스트를 굵게
                                  color: Colors.white, // 텍스트 색상
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              news.title,
                              style: TextStyle(
                                fontSize:
                                    screenSize.width * 0.06, // 동적으로 폰트 크기 설정
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  " ${news.broadcastingCompany} | ${news.date}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 107, 108,
                                        113), // 텍스트 색상 screenSize.width * 0.04, // 동적 텍스트 크기
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width * 0.33,
                                ),
                                const Icon(Icons.visibility),
                                SizedBox(width: 5),
                                Text(
                                  '${news.viewCount} views',
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              news.contents,
                              style: TextStyle(
                                  fontSize: screenSize.width *
                                      0.045), // 동적으로 폰트 크기 설정
                            ),
                            const SizedBox(height: 16),

                            // Row(
                            //   children: [
                            //     const Icon(Icons.thumb_up),
                            //     const SizedBox(width: 5),
                            //     Text('${news.likeCount} likes'),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // 뒤로가기 버튼
                Positioned(
                  top: 5,
                  left: 6,
                  child: SafeArea(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop(); // 뒤로가기
                      },
                    ),
                  ),
                ),
              ],
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
      ),
    );
  }
}
