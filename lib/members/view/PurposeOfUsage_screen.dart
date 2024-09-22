import 'package:flick_frontend/common/const/colors.dart';
import 'package:flick_frontend/members/view/success_screen.dart';
import 'package:flutter/material.dart';

class PurposeOfUsageScreen extends StatefulWidget {
  const PurposeOfUsageScreen({super.key});

  @override
  State<PurposeOfUsageScreen> createState() => _PurposeOfUsageScreenState();
}

class _PurposeOfUsageScreenState extends State<PurposeOfUsageScreen> {
  final TextEditingController _nameController = TextEditingController();
  String selectedPurpose = "";

  // void _showPurposeSelection() {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
  //     ),
  //     builder: (BuildContext context) {
  //       return SizedBox(
  //         height: MediaQuery.of(context).size.height * 0.17, // 원하는 높이로 설정
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               height: MediaQuery.of(context).size.height * 0.02,
  //             ),
  //             ListTile(
  //               leading: Icon(
  //                 selectedPurpose == "일반유저 목적으로 사용"
  //                     ? Icons.check_circle
  //                     : Icons.circle_outlined,
  //                 color: selectedPurpose == "일반유저 목적으로 사용"
  //                     ? PRIMARY_COLOR
  //                     : Colors.grey,
  //               ),
  //               title: const Text('일반유저 목적으로 사용'),
  //               onTap: () {
  //                 setState(() {
  //                   selectedPurpose = "일반유저 목적으로 사용";
  //                 });
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             ListTile(
  //               leading: Icon(
  //                 selectedPurpose == "학교 학생 목적으로 사용"
  //                     ? Icons.check_circle
  //                     : Icons.circle_outlined,
  //                 color: selectedPurpose == "학교 학생 목적으로 사용"
  //                     ? STUDENT_BUTTON_COLOR
  //                     : Colors.grey,
  //               ),
  //               title: Text(
  //                 '학교 학생 목적으로 사용',
  //                 style: TextStyle(
  //                   color: selectedPurpose == "학교 학생 목적으로 사용"
  //                       ? STUDENT_BUTTON_COLOR
  //                       : Colors.black,
  //                 ),
  //               ),
  //               onTap: () {
  //                 setState(() {
  //                   selectedPurpose = "학교 학생 목적으로 사용";
  //                 });
  //                 Navigator.pop(context);
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  void _showPurposeSelection() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          color: Colors.white, // 전체 배경 흰색으로 설정
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25, // 높이 조정
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 정렬
              children: [
                // 상단 제목 추가
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Text(
                    '앱 사용 목적', // 제목 텍스트
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // 첫 번째 옵션
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
                    title: Text(
                      '일반유저 목적으로 사용',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: selectedPurpose == "일반유저 목적으로 사용"
                            ? PRIMARY_COLOR // 선택 시 PRIMARY_COLOR
                            : Colors.grey, // 비선택 시 검은색
                      ),
                    ),
                    trailing: Icon(
                      selectedPurpose == "일반유저 목적으로 사용"
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      color: selectedPurpose == "일반유저 목적으로 사용"
                          ? PRIMARY_COLOR
                          : Colors.grey,
                      size: 30, // 아이콘 크기 조정
                    ),
                    onTap: () {
                      setState(() {
                        selectedPurpose = "일반유저 목적으로 사용";
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                // 두 번째 옵션
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: selectedPurpose == "학교 학생 목적으로 사용"
                          ? PRIMARY_COLOR
                          : Colors.grey,
                    ),
                    color: Colors.white, // 각 항목의 배경색도 흰색으로 설정
                  ),
                  child: ListTile(
                    title: Text(
                      '학교 학생 목적으로 사용',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: selectedPurpose == "학교 학생 목적으로 사용"
                            ? PRIMARY_COLOR // 선택 시 PRIMARY_COLOR
                            : Colors.grey, // 비선택 시 검은색
                      ),
                    ),
                    trailing: Icon(
                      selectedPurpose == "학교 학생 목적으로 사용"
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      color: selectedPurpose == "학교 학생 목적으로 사용"
                          ? PRIMARY_COLOR
                          : Colors.grey,
                      size: 30, // 아이콘 크기 조정
                    ),
                    onTap: () {
                      setState(() {
                        selectedPurpose = "학교 학생 목적으로 사용";
                      });
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
  void dispose() {
    // 메모리 누수를 방지하기 위해 dispose에서 컨트롤러 해제
    _nameController.dispose();
    super.dispose();
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
                    style: TextStyle(fontSize: 14, color: MAIN_TEXT_COLOR),
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
                                    ? PRIMARY_COLOR
                                    : STUDENT_BUTTON_COLOR),
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
                          String userName = _nameController.text;

                          if (userName.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SuccessScreen(userName: userName)));
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
                          String userName = _nameController.text;

                          if (userName.isNotEmpty) {
                            // context.go('')
                            Navigator.push(
                                // context.go(''),
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SuccessScreen(userName: userName)));
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
        ));
  }
}
