import 'package:flick_frontend/auth/view/communityAgreement_screen.dart';
import 'package:flick_frontend/auth/view/onBoarding_screen.dart';
import 'package:flick_frontend/auth/view/personalInfoAgreement_screen.dart';
import 'package:flick_frontend/auth/view/serviceAgreement_screen.dart';
import 'package:flutter/material.dart';
import 'package:flick_frontend/common/const/colors.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  bool _isAllChecked = false;
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
          right: screenWidth * 0.05,
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
              SizedBox(
                height: screenHeight * 0.05,
              ),
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
                  // context
                  //     .go('/service-agreement', extra: {'title': '서비스 이용약관'});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Serviceagreement(
                                title: "Service",
                              )));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PersonalInfoAgreement(
                              title: "personalInfo")));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CommunityAgreement(title: "community")));
                },
              ),
              SizedBox(
                height: screenHeight * 0.35,
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05),
                child: Center(
                  child: ElevatedButton(
                    onPressed: _isAllChecked
                        ? () {
                            print('Button Pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OnboardingScreen()));
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: PRIMARY_COLOR,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.345,
                          vertical: screenHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
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

  Widget _buildCheckboxListTile({
    required String title,
    required bool value,
    required Function(bool?) onChanged,
    required VoidCallback onTapIcon,
  }) {
    return ListTile(
      leading: Checkbox(
        activeColor: PRIMARY_COLOR,
        overlayColor: const WidgetStatePropertyAll(PRIMARY_COLOR),
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

  void _updateAllChecked() {
    setState(() {
      _isAllChecked =
          _serviceAgreement && _personalInfoAgreement && _communityAgreement;
    });
  }
}
