import 'package:flick_frontend/challenge/view/challenge_screen.dart';
import 'package:flick_frontend/members/view/myPage_screen.dart';
import 'package:flick_frontend/news/view/ecology_screen.dart';
import 'package:flick_frontend/rank/view/rank_screen.dart';
import 'package:flutter/material.dart';
import 'package:flick_frontend/common/component/NavigationBar.dart';
import 'package:flick_frontend/common/const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _onIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
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
      body: TabBarView(
        controller: _tabController,
        children: const [
          EcologyScreen(),
          ChallengeScreen(),
          RankScreen(),
          MypageScreen()
        ],
      ),
      bottomNavigationBar: Navigationbar(
        selectedIndex: _selectedIndex,
        onIndexChanged: _onIndexChanged,
        tabController: _tabController,
      ),
    );
  }
}
