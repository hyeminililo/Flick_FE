import 'package:flick_frontend/members/view/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flick_frontend/members/model/members_model.dart';
import 'package:flick_frontend/members/repository/members_repository.dart';

class PurposeOfUsageScreen extends StatefulWidget {
  const PurposeOfUsageScreen({super.key});

  @override
  State<PurposeOfUsageScreen> createState() => _PurposeOfUsageScreenState();
}

class _PurposeOfUsageScreenState extends State<PurposeOfUsageScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _gradeClassController = TextEditingController();
  String selectedPurpose = "";
  final Dio dio = Dio(); // Dio 인스턴스 생성
  late MembersRepository membersRepository;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    membersRepository = MembersRepository(dio); // MembersRepository 초기화
  }

  // 서버에 데이터 전송하는 메서드
  Future<void> sendDataToServer() async {
    // Members 객체 생성
    Members member = Members(
      type: selectedPurpose == "학교 학생 목적으로 사용"
          ? UserType.STUDENT
          : UserType.GENERAL,
      nickname: _nameController.text,
      school: _schoolController.text,
      gradeClass: _gradeClassController.text,
    );

    try {
      // final response = await membersRepository
      //    .postMembers(member.toJson()); // JSON으로 변환하여 전송
      final response = await membersRepository.postMembers(member);
      print(member.toJson());
      // 응답 처리
      print('서버에 데이터 전송 성공: $response');
    } catch (error) {
      print('서버에 데이터 전송 실패: $error');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _schoolController.dispose();
    _gradeClassController.dispose();
    super.dispose();
  }

  // 목적 선택 모달
  void _showPurposeSelection() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(
                selectedPurpose == "일반유저 목적으로 사용"
                    ? Icons.check_circle
                    : Icons.circle_outlined,
                color: selectedPurpose == "일반유저 목적으로 사용"
                    ? Colors.green
                    : Colors.grey,
              ),
              title: const Text('일반유저 목적으로 사용'),
              onTap: () {
                setState(() {
                  selectedPurpose = "일반유저 목적으로 사용";
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                selectedPurpose == "학교 학생 목적으로 사용"
                    ? Icons.check_circle
                    : Icons.circle_outlined,
                color: selectedPurpose.isEmpty ? Colors.grey : Colors.blue,
              ),
              title: const Text('학교 학생 목적으로 사용'),
              onTap: () {
                setState(() {
                  selectedPurpose = "학교 학생 목적으로 사용";
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Text(
                    "앱 사용 목적 선택",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Pretendard",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const Text(
                  "앱 사용 목적",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 8.0),
                InkWell(
                  onTap: _showPurposeSelection,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: selectedPurpose.isEmpty
                              ? Colors.grey
                              : selectedPurpose == "일반유저 목적으로 사용"
                                  ? Colors.green
                                  : Colors.blue),
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
                                      ? Colors.green
                                      : Colors.blue,
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
                    controller: _nameController,
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
                      onPressed: () {
                        if (_nameController.text.isNotEmpty) {
                          sendDataToServer(); // 서버에 데이터 전송
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SuccessScreen(userName: _nameController.text),
                            ),
                          );
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
                    "닉네임을 입력해주세요",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: '예) 홍길동',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "재학중인 학교 이름을 입력해주세요",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: _schoolController,
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
                    controller: _gradeClassController,
                    decoration: InputDecoration(
                      hintText: '예) 3-1',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_nameController.text.isNotEmpty) {
                          sendDataToServer(); // 서버에 데이터 전송
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SuccessScreen(userName: _nameController.text),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
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
