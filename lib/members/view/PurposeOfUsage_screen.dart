import 'package:flick_frontend/common/const/colors.dart';
import 'package:flick_frontend/common/const/layout.dart';
import 'package:flick_frontend/common/provider/dio_provider.dart';
import 'package:flick_frontend/members/model/members_model.dart';
import 'package:flick_frontend/members/view/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 선택된 목적을 관리하는 StateProvider
final selectedPurposeProvider = StateProvider<String>((ref) {
  return "";
});
// TextEditingController를 관리하는 Provider -> ㅇ게 뭔지 모르겠음
final nameControllerProvider = Provider((ref) => TextEditingController());
final schoolControllerProvider = Provider((ref) => TextEditingController());
final gradeControllerProvider = Provider((ref) => TextEditingController());

class PurposeOfUsageScreen extends ConsumerWidget {
  const PurposeOfUsageScreen({super.key});

  void _showPurposeSelection(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        String selectedPurpose =
            ref.watch(selectedPurposeProvider); // .state 제거

        return Container(
          color: Colors.white,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Text(
                    '앱 사용 목적',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), // 모서리 둥글게
                    border: Border.all(
                      color: selectedPurpose == "일반유저 목적으로 사용"
                          ? PRIMARY_COLOR
                          : Colors.grey, // 선택된 항목 테두리 색상
                    ),
                    color: Colors.white, // 각 항목의 배경색도 흰색으로 설정
                  ),
                  child: ListTile(
                    title: const Text(
                      '일반유저 목적으로 사용',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        // 비선택 시 검은색
                      ),
                    ),
                    onTap: () {
                      ref.read(selectedPurposeProvider.notifier).state =
                          "일반유저 목적으로 사용"; // 수정
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), // 모서리 둥글게
                    border: Border.all(
                      color: selectedPurpose == "일반유저 목적으로 사용"
                          ? PRIMARY_COLOR
                          : Colors.grey, // 선택된 항목 테두리 색상
                    ),
                    color: Colors.white, // 각 항목의 배경색도 흰색으로 설정
                  ),
                  child: ListTile(
                    title: const Text('학교 학생 목적으로 사용'),
                    onTap: () {
                      ref.read(selectedPurposeProvider.notifier).state =
                          "학교 학생 목적으로 사용"; // 수정
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(nameControllerProvider);
    final selectedPurpose = ref.watch(selectedPurposeProvider); // .state 제거
    final schoolController = ref.watch(schoolControllerProvider);
    final gradeController = ref.watch(gradeControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                const Center(
                  child: Text("앱 사용 목적 선택", style: defaultTextStyle),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const Text(
                  "앱 사용 목적",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, color: MAIN_TEXT_COLOR),
                ),
                const SizedBox(height: 8.0),
                InkWell(
                  onTap: () => _showPurposeSelection(context, ref),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedPurpose.isEmpty
                            ? Colors.grey
                            : selectedPurpose == "일반유저 목적으로 사용"
                                ? PRIMARY_COLOR
                                : STUDENT_BUTTON_COLOR,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectedPurpose.isEmpty
                                ? "앱 사용 목적을 선택하세요"
                                : selectedPurpose,
                            style: TextStyle(
                              color: selectedPurpose.isEmpty
                                  ? Colors.grey
                                  : selectedPurpose == "일반유저 목적으로 사용"
                                      ? PRIMARY_COLOR
                                      : STUDENT_BUTTON_COLOR,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.green,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                if (selectedPurpose == "일반유저 목적으로 사용") ...[
                  const SizedBox(height: 20),
                  const Text(
                    "닉네임을 입력해주세요",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: '예) 홍길동',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        String userName = nameController.text;
                        final member = Members(
                            type: UserType.GENERAL,
                            nickname: userName,
                            school: '',
                            gradeClass: '');

                        final membersonboardingRepository =
                            ref.watch(membersRepositoryProvider);

                        try {
                          await membersonboardingRepository.postMembers(member);
                          print('회원 정보 전송 성공');
                          print("type: ${member.type}");
                          print("nickname: ${member.nickname}");
                          print("gradeClass : ${member.gradeClass}");
                          print("school: ${member.school}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SuccessScreen(userName: userName),
                            ),
                          );
                        } catch (e) {
                          print('회원 정보 전송 실패: $e');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 64.0),
                      ),
                      child: const Text(
                        "가입하기",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
                if (selectedPurpose == "학교 학생 목적으로 사용") ...[
                  const SizedBox(height: 20),
                  const Text(
                    "재학중인 학교 이름을 입력해주세요",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: schoolController,
                    decoration: InputDecoration(
                      hintText: '예) 집현중학교',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "학년과 반을 선택해주세요.",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: gradeController,
                    decoration: InputDecoration(
                      hintText: '예) 3-1',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "이름을 입력해주세요",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: '예) 홍길동',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        UserType userType = UserType.STUDENT;
                        String userName = nameController.text;
                        String school = schoolController.text;
                        String gradeClass = gradeController.text;
                        final member = Members(
                            type: userType,
                            nickname: userName,
                            school: school,
                            gradeClass: gradeClass);

                        final membersonboardingRepository =
                            ref.watch(membersRepositoryProvider);

                        try {
                          await membersonboardingRepository.postMembers(member);
                          print('회원 정보 전송 성공');
                          print('회원 정보 전송 성공');
                          print("type: ${member.type}");
                          print("nickname: ${member.nickname}");
                          print("gradeClass : ${member.gradeClass}");
                          print("school: ${member.school}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SuccessScreen(userName: userName),
                            ),
                          );
                        } catch (e) {
                          print('회원 정보 전송 실패: $e');
                          print('회원 정보 전송 성공');
                          print("type: ${member.type}");
                          print("nickname: ${member.nickname}");
                          print("gradeClass : ${member.gradeClass}");
                          print("school: ${member.school}");
                          print("==============");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: STUDENT_BUTTON_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 64.0),
                      ),
                      child: const Text(
                        "가입하기",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
