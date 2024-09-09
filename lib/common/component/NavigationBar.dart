import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;
  final TabController tabController;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
    required this.tabController,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight > 600 ? 80.0 : 70.0,
      child: TabBar(
        controller: widget.tabController,
        indicatorColor: Colors.transparent,
        labelColor: PRIMARY_COLOR,
        unselectedLabelColor: Colors.grey,
        onTap: widget.onIndexChanged, // 탭 클릭 시 호출되는 함tn
        tabs: <Widget>[
          Tab(
            icon: Icon(
              widget.selectedIndex == 0 ? Icons.home : Icons.home_outlined,
            ),
            text: "홈",
          ),
          Tab(
            icon: Icon(
              widget.selectedIndex == 1 ? Icons.flag : Icons.outlined_flag,
            ),
            text: "챌린지",
          ),
          Tab(
            icon: Icon(
              widget.selectedIndex == 2
                  ? Icons.emoji_events
                  : Icons.emoji_events_outlined,
            ),
            text: "랭킹",
          ),
          Tab(
            icon: Icon(
              widget.selectedIndex == 3 ? Icons.person : Icons.person_outline,
            ),
            text: "프로필",
          ),
        ],
      ),
    );
  }
}
