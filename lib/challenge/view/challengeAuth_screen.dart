// 그리드 뷰로 바꿨습니다. 위의 코드는 혹시 모르니 남겨두겠습니다.
// 추후 문제 없을시, 삭제하겠습니다.
// 허나 이 부분에서 궁금한 것은, 전체 사진 조회 즉, 갤러리에서는 이미지 신고 기능을
// 추가하였는데, 이 참여자 프로필 사진을 표시하는 부분에서는 그런 신고 기능이 필요없는 것인지
// 의문입니다. 이 부분 상의가 필요할 것 같습니다. 이 부분은 클라이언트와도 상의가 안된 부분이라
// 어떻게 하면 좋을지 스스로 판단할 수 없어, 이렇게 글 남깁니다.
// + 추가로, 추후 dev브랜치에서 통합 테스트후 문제 발생시 연락 부탁드려요.
import 'package:flick_frontend/challenge/provider/provs/challengeMy_provider.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChallengeAuthImagesScreen extends ConsumerStatefulWidget {
  final String title;
  final int challengeId;
  final DateTime selectedDate;

  const ChallengeAuthImagesScreen({
    super.key,
    required this.title,
    required this.challengeId,
    required this.selectedDate,
  });

  @override
  ConsumerState<ChallengeAuthImagesScreen> createState() =>
      _ChallengeAuthImagesScreenState();
}

class _ChallengeAuthImagesScreenState
    extends ConsumerState<ChallengeAuthImagesScreen> {
  late DateTime selectedDate;
  late List<int> dateList;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
    _generateDateList();
  }

  void _generateDateList() {
    dateList = [];
    for (int i = -2; i <= 2; i++) {
      dateList.add(selectedDate.add(Duration(days: i)).day);
    }
  }

  void _onDateSelected(int day) {
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
      _generateDateList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // 챌린지 ID와 선택된 날짜를 기반으로 ChallengeImageParams 생성
    final params = ChallengeImageParams(
      challengeId: widget.challengeId,
      month: selectedDate.month,
      day: selectedDate.day,
    );

    // challengeAuthImagesProvider를 통해 참여자 인증 사진 리스트 가져오기
    final authImagesAsyncValue = ref.watch(challengeAuthImagesProvider(params));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: PRIMARY_COLOR,
      ),
      body: Container(
        color: PRIMARY_COLOR,
        child: Stack(
          children: [
            authImagesAsyncValue.when(
              data: (memberPictureUrls) {
                if (memberPictureUrls == null ||
                    memberPictureUrls.memberPictureUrls.isEmpty) {
                  return const Center(
                    child: Text(
                      "참여자 인증 사진이 없습니다.",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(), // 스크롤
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 한 행에 2개의 아이템
                      crossAxisSpacing: screenWidth * 0.02, // 열 간격
                      mainAxisSpacing: screenWidth * 0.02, // 행 간격
                      childAspectRatio: 1.0, // 아이템의 가로:세로 비율 (정사각형)
                    ),
                    itemCount: memberPictureUrls.memberPictureUrls.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              memberPictureUrls.memberPictureUrls[index],
                              fit: BoxFit.cover,
                              width: double.infinity, // 부모 위젯의 폭에 맞춤
                              height: double.infinity, // 부모 위젯의 높이에 맞춤
                              // 위 주석 코드에서는 아래 에러 부분이 Container로 에러 표시를 하였는데,
                              // 아이콘으로 해봤습니다. 이 부분에서 추후 문제 발생시, 원래로 복구하겠습니다.
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey,
                                  child: const Center(
                                    child: Icon(
                                      Icons.broken_image,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
              error: (error, stack) => Center(
                child: Text(
                  "오류 발생: $error",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),

            // 날짜 선택 위젯
            Positioned(
              left: screenWidth * 0.05,
              top: MediaQuery.of(context).size.height * 0.1,
              child: Container(
                width: screenWidth * 0.1,
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
                              ? PRIMARY_COLOR
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            day.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
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
