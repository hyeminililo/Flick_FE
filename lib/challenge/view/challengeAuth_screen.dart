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
      body: Stack(
        children: [
          // 인증 사진 리스트
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
                  physics: const AlwaysScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: screenWidth * 0.02,
                    mainAxisSpacing: screenWidth * 0.02,
                    childAspectRatio: 1.0,
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
                            width: double.infinity,
                            height: double.infinity,
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
    );
  }
}
