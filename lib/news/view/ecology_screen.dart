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
class EcologyScreen extends ConsumerStatefulWidget {
  const EcologyScreen({super.key});

  @override
  _EcologyScreenState createState() => _EcologyScreenState();
}

class _EcologyScreenState extends ConsumerState<EcologyScreen> {
  late PageController _pageController;
  int _currentPage = 0; // 현재 페이지 인덱스를 저장

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // PageController 초기화
  }

  @override
  void dispose() {
    _pageController.dispose(); // PageController 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // FutureProvider를 구독하여 상태를 가져옴
    final newsListAsyncValue = ref.watch(newsListProvider);

    return SafeArea(
      child: Scaffold(
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
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              // 첫 번째 컨테이너: 랜덤 뉴스 표시
              newsListAsyncValue.when(
                data: (newsList) {
                  final randomNews = (newsList..shuffle()).take(4).toList();
                  if (randomNews.isEmpty) return SizedBox.shrink();
                  return Column(
                    children: [
                      // PageView
                      SizedBox(
                        height: screenHeight * 0.2, // 화면 높이 20%
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: randomNews.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            final newsItem = randomNews[index];
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05),
                              padding: EdgeInsets.all(screenWidth * 0.02),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          newsItem.title ?? '제목 없음',
                                          style: TextStyle(
                                              fontSize: screenHeight * 0.02,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(height: screenHeight * 0.005),
                                        Text(
                                          newsItem.contents ?? '내용 없음',
                                          style: TextStyle(
                                              fontSize: screenHeight * 0.015,
                                              color: Colors.white70),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (newsItem.picture != null)
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.02),
                                      child: Image.network(
                                        newsItem.picture!,
                                        width: screenWidth * 0.2,
                                        height: screenWidth * 0.1,
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                          height: 20,
                          child: Center(
                            child: DotsIndicator(
                              dotsCount: randomNews.length,
                              position: _currentPage,
                              decorator: const DotsDecorator(
                                color: Colors.grey, // 비활성화된 점 색상
                                activeColor: PRIMARY_COLOR, // 활성화된 점 색상
                              ),
                            ),
                          ))
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) =>
                    Center(child: Text('Error: $error')),
              ),
              SizedBox(height: screenHeight * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Text(
                  "최신 환경뉴스",
                  style: TextStyle(
                    fontSize: screenHeight * 0.025,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pretendard",
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              // 두 번째 컨테이너: 뉴스 리스트
              newsListAsyncValue.when(
                data: (newsList) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      final news = newsList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenHeight * 0.01,
                        ),
                        child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NewsDetailScreen(newsId: news.newsId),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(screenWidth * 0.02),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 이미지 섹션
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        news.picture ?? '', // 이미지 URL
                                        width: screenWidth *
                                            0.3, // 이미지 너비 (카드의 일부만 차지)
                                        height: screenHeight * 0.15, // 이미지 높이
                                        fit: BoxFit.fill, // 이미지를 가로로 꽉 채우기
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            screenWidth * 0.03), // 이미지와 텍스트 간격

                                    // 텍스트 섹션
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // 라벨 (환경뉴스)
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: screenHeight * 0.005,
                                              horizontal: screenWidth * 0.03,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.green.shade400,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Text(
                                              '환경뉴스',
                                              style: TextStyle(
                                                fontSize: screenWidth * 0.027,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: screenHeight * 0.01),

                                          // 뉴스 제목
                                          Text(
                                            news.title ?? '제목 없음',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenHeight * 0.02,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          SizedBox(height: screenHeight * 0.01),

                                          // 조회수 섹션
                                          Row(
                                            children: [
                                              Icon(Icons.visibility, size: 16),
                                              SizedBox(
                                                  width: screenWidth * 0.01),
                                              Text(news.viewCount.toString() ??
                                                  '0'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
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
      ),
    );
  }
}
