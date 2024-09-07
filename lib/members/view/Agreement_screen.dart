import 'package:flick_frontend/common/const/colors.dart';
import 'package:flick_frontend/members/view/communityAgreement_screen.dart';
import 'package:flick_frontend/members/view/personalInfoAgreement_screen.dart';
import 'package:flick_frontend/members/view/serviceAgreement_screen.dart';
import 'package:flutter/material.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  bool _isAllChecked = false;

  // 개별 체크박스 상태 변수
  bool _serviceAgreement = false;
  bool _personalInfoAgreement = false;
  bool _communityAgreement = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.05,
          left: screenWidth * 0.05,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Flick\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "약관에 동의",
                      style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                    TextSpan(
                      text: "해주세요",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              // "서비스 이용약관 전체동의" 버튼
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isAllChecked = !_isAllChecked;
                    _serviceAgreement = _isAllChecked;
                    _personalInfoAgreement = _isAllChecked;
                    _communityAgreement = _isAllChecked;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _isAllChecked ? PRIMARY_COLOR : Colors.grey,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                    color:
                        _isAllChecked ? PRIMARY_COLOR.withOpacity(0.1) : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check,
                        color: _isAllChecked ? PRIMARY_COLOR : Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "서비스 이용약관 전체동의",
                        style: TextStyle(
                          color: _isAllChecked ? PRIMARY_COLOR : Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 개별 체크박스들 (체크박스 위치는 왼쪽)
              _buildCheckboxListTile(
                title: '[필수] 서비스 이용약관 동의',
                value: _serviceAgreement,
                onChanged: (bool? value) {
                  setState(() {
                    _serviceAgreement = value!;
                    _updateAllChecked();
                  });
                },
                onTapIcon: () {
                  _navigateToServiceAgreementScreen(context, '서비스 이용약관');
                },
              ),
              _buildCheckboxListTile(
                title: '[필수] 개인 정보 수집 및 이용 동의',
                value: _personalInfoAgreement,
                onChanged: (bool? value) {
                  setState(() {
                    _personalInfoAgreement = value!;
                    _updateAllChecked();
                  });
                },
                onTapIcon: () {
                  _navigateToPersonalInfoAgreementScreen(
                      context, '개인 정보 수집 및 이용');
                },
              ),
              _buildCheckboxListTile(
                title: '[필수] 커뮤니티 이용규칙 확인',
                value: _communityAgreement,
                onChanged: (bool? value) {
                  setState(() {
                    _communityAgreement = value!;
                    _updateAllChecked();
                  });
                },
                onTapIcon: () {
                  _navigateToCommunityAgreementScreen(context, '커뮤니티 이용규칙');
                },
              ),

              // 다음으로 버튼
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05),
                child: Center(
                  child: ElevatedButton(
                    onPressed: _isAllChecked
                        ? () {
                            // 다음 화면으로 이동하거나 원하는 작업 수행
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.3,
                        vertical: screenHeight * 0.02,
                      ),
                    ),
                    child: Text(
                      '다음으로',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 개별 체크박스 생성 메서드
  Widget _buildCheckboxListTile({
    required String title,
    required bool value,
    required Function(bool?) onChanged,
    required VoidCallback onTapIcon,
  }) {
    return ListTile(
      leading: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
      title: Text(title),
      trailing: IconButton(
        icon: const Icon(Icons.chevron_right),
        onPressed: onTapIcon,
      ),
    );
  }

  // 새로운 화면으로 이동하는 메서드
  void _navigateToServiceAgreementScreen(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Serviceagreement(title: title),
      ),
    );
  }

  void _navigateToPersonalInfoAgreementScreen(
      BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalInfoAgreement(title: title),
      ),
    );
  }

  void _navigateToCommunityAgreementScreen(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommunityAgreement(title: title),
      ),
    );
  }

  // 전체 동의 상태를 업데이트하는 헬퍼 메서드
  void _updateAllChecked() {
    setState(() {
      _isAllChecked =
          _serviceAgreement && _personalInfoAgreement && _communityAgreement;
    });
  }
}
