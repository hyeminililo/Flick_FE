import 'package:flick_frontend/auth/view/login_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              buildPage(
                context,
                title: "카테고리별 정보를 확인해보세요",
                imagePath: "assets/images/preDescription1.png",
              ),
              buildPage(
                context,
                title: "다양한 챌린지에 참여해보세요",
                imagePath: "assets/images/preDescription2.png",
              ),
              buildPage(
                context,
                title: "서로의 순위를 확인해보세요",
                imagePath: "assets/images/preDescription3.png",
              ),
              buildPage(
                context,
                title: "활동 기록을 한눈에 파악해보세요",
                imagePath: "assets/images/preDescription4.png",
              ),
            ],
          ),
          Positioned(
            top: 40.0,
            right: 20.0,
            child: Row(
              children: [
                Row(
                  children: List<Widget>.generate(4, (int index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 8.0,
                      width: (index == _currentPage) ? 24.0 : 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: (index == _currentPage)
                            ? Colors.green
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    );
                  }),
                ),
                const SizedBox(width: 10.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    '건너뛰기',
                    style: TextStyle(color: Colors.green, fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40.0,
            left: 20.0,
            right: 20.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                if (_currentPage < 3) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }
              },
              child: Text(
                _currentPage < 3 ? '다음으로' : '시작하기 ➔',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(BuildContext context,
      {required String title, required String imagePath}) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Pretendard",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.05),
          Image.asset(
            imagePath,
            height: screenHeight * 0.4,
            width: screenWidth * 0.8,
            fit: BoxFit.contain,
          ),
          SizedBox(height: screenHeight * 0.1),
        ],
      ),
    );
  }
}
