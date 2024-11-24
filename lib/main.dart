import 'package:flick_frontend/auth/view/login_screen.dart';
import 'package:flick_frontend/challenge/view/challenge_screen.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flick_frontend/members/view/myPage/profileScreen.dart';
import 'package:flick_frontend/news/view/ecology_screen.dart';
import 'package:flick_frontend/ranking/view/generalRank_screen.dart';
import 'package:flick_frontend/ranking/view/rank_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/env.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var kakaoNativeAppKey = Env.kakaoNativeAppKey;
  var kakaoJavaScriptKey = Env.kakaoJavaScriptKey;
  KakaoSdk.init(
    nativeAppKey: kakaoNativeAppKey,
    javaScriptAppKey: kakaoJavaScriptKey,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//   // 각 화면의 위젯 리스트
//   final List<Widget> _screens = [
//     EcologyScreen(),
//     ChallengeScreen(),
//     RankScreen(),
//     MyPageScreen2(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: Container(
//         color: Colors.white, // 배경색 설정
//         height: 60, // 네비게이션 바 높이
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 아이템 간격 균일
//           children: [
//             _buildNavItem(Icons.home, '홈', 0),
//             _buildNavItem(Icons.flag, '챌린지', 1),
//             _buildNavItem(Icons.leaderboard, '랭킹', 2),
//             _buildNavItem(Icons.person, '프로필', 3),
//           ],
//         ),
//       ),
//     );
//   }

//   // 네비게이션 아이템 빌드
//   Widget _buildNavItem(IconData icon, String label, int index) {
//     final isSelected = _selectedIndex == index; // 현재 선택된 인덱스 확인
//     return GestureDetector(
//       onTap: () => _onItemTapped(index), // 탭 이벤트 처리
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: isSelected ? PRIMARY_COLOR : Colors.grey, // 선택된 경우 색상 변경
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               color: isSelected ? PRIMARY_COLOR : Colors.grey, // 선택된 경우 색상 변경
//               fontWeight: isSelected
//                   ? FontWeight.bold
//                   : FontWeight.normal, // 선택된 경우 굵게 표시
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // 각 탭의 Navigator를 관리하는 리스트
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    final isFirstRouteInCurrentTab =
        !(await _navigatorKeys[_selectedIndex].currentState?.maybePop() ??
            false);

    if (isFirstRouteInCurrentTab) {
      if (_selectedIndex != 0) {
        setState(() {
          _selectedIndex = 0;
        });
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, // 뒤로가기 제어
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            _buildNavigator(0, const EcologyScreen()),
            _buildNavigator(1, const ChallengeScreen()),
            _buildNavigator(2, const RankScreen()),
            _buildNavigator(3, const MyPageScreen2()),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.flag), label: '챌린지'),
            BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: '랭킹'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: PRIMARY_COLOR,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildNavigator(int index, Widget child) {
    return Navigator(
      key: _navigatorKeys[index], // 독립적인 Navigator 키
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (_) => child, // 해당 탭의 초기 화면
        );
      },
    );
  }
}
