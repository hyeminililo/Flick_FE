import 'package:flick_frontend/auth/view/login_screen.dart';
import 'package:flick_frontend/challenge/view/challenge_screen.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flick_frontend/members/view/myPage/profileScreen.dart';
import 'package:flick_frontend/news/view/ecology_screen.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: PRIMARY_COLOR),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

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
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_events), label: '랭킹'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: SUB_COLOR,
          onTap: _onItemTapped,
          showUnselectedLabels: true, // 선택되지 않은 아이템의 라벨도 표시
        ),
      ),
    );
  }

  Widget _buildNavigator(int index, Widget child) {
    return Navigator(
      key: _navigatorKeys[index], // 독립적인 Navigator 키
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (_) => child,
        );
      },
    );
  }
}
