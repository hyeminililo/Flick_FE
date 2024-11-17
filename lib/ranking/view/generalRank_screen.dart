import 'package:flick_frontend/ranking/provider/generalRanking_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flick_frontend/members/model/memberInfo_model.dart';

class GeneralRankScreen extends ConsumerWidget {
  const GeneralRankScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final rankingListAsync = ref.watch(rankingListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '친환경 랭킹',
          style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
        ),
      ),
      body: rankingListAsync.when(
        data: (members) => SingleChildScrollView(
          child: Column(
            children: [
              // Top 3 section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (members.length > 1)
                      _buildTopMember(members[1], screenWidth * 0.2, 2),
                    if (members.isNotEmpty)
                      _buildTopMember(members[0], screenWidth * 0.25, 1),
                    if (members.length > 2)
                      _buildTopMember(members[2], screenWidth * 0.2, 3),
                  ],
                ),
              ),
              // 리스트로 전체 순위 표시
              Container(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    final member = members[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: index == 0 ? PRIMARY_COLOR : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Row(
                            children: [
                              Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color:
                                      index == 0 ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.05),
                              CircleAvatar(
                                backgroundImage: member.picture != null
                                    ? NetworkImage(member.picture!)
                                    : const AssetImage(
                                        'assets/images/profile.png'),
                              ),
                              SizedBox(width: screenWidth * 0.05),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        member.nickname,
                                        style: TextStyle(
                                          color: index == 0
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${member.score}p',
                                      style: TextStyle(
                                        color: index == 0
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Failed to load ranking: $error')),
      ),
    );
  }

  // Top 3 멤버를 위한 위젯 (사이즈 조정)
  Widget _buildTopMember(MemberInfoModel member, double size, int place) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              const SizedBox(height: 4.0),
              Container(
                width: size * 1.2,
                height: size * 1.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5)
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: size / 3,
                        backgroundImage: member.picture != null
                            ? NetworkImage(member.picture!)
                            : const AssetImage('assets/images/profile.png'),
                      ),
                      const SizedBox(height: 5),
                      Text(member.nickname),
                      const SizedBox(height: 5),
                      Text(
                        '${member.score}p',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              // 순위에 따라 아이콘 표시
              if (place == 1) const Icon(Icons.star, color: Colors.yellow),
              if (place == 2) const Icon(Icons.star, color: Colors.grey),
              if (place == 3) const Icon(Icons.star, color: Colors.brown),
            ],
          ),
        ],
      ),
    );
  }
}
