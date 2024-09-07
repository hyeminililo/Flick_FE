import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery로 화면의 크기를 가져옴.
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.15, // 화면 높이의 15%
            ),
            Image.asset(
              "assets/images/flick.png",
              height: screenHeight * 0.20, // 화면 높이의 20%
              width: screenWidth * 0.3, // 화면 너비의 30%
            ),
            SizedBox(
              height: screenHeight * 0.03, // 화면 높이의 3%
            ),
            const Text(
              "Flick",
              style: TextStyle(
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 50, // 이 부분은 고정 크기로 유지
                fontFamily: "Pretendard",
              ),
            ),
            SizedBox(
              height: screenHeight * 0.13, // 화면 높이의 13%
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05, // 화면 너비의 5%
                  vertical: screenHeight * 0.02, // 화면 높이의 2%
                ),
                backgroundColor: const Color(0xff252525),
                foregroundColor: const Color(0xff252525),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                elevation: 0,
              ),
              child: SizedBox(
                  width: screenWidth * 0.8, // 화면 너비의 80%
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/yellowKakao.png",
                        alignment: Alignment.center,
                        width: screenWidth * 0.1, // 화면 너비의 10%
                        height: screenHeight * 0.03, // 화면 높이의 3%
                      ),
                      SizedBox(width: screenWidth * 0.02), // 화면 너비의 2%
                      const Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "카카오로 3초 만에 로그인",
                            style: TextStyle(
                              color: SUB_COLOR,
                              fontSize: 20, // 이 부분은 고정 크기로 유지
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.04, // 화면 높이의 2%
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05, // 화면 너비의 5%
                  vertical: screenHeight * 0.02, // 화면 높이의 2%
                ),
                backgroundColor: const Color(0xff252525),
                foregroundColor: const Color(0xff252525),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                elevation: 0,
              ),
              child: SizedBox(
                  width: screenWidth * 0.8,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/google.png",
                        alignment: Alignment.center,
                        width: screenWidth * 0.1, // 화면 너비의 10%
                        height: screenHeight * 0.03, // 화면 높이의 3%
                      ),
                      SizedBox(width: screenWidth * 0.02), // 화면 너비의 2%
                      const Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "구글로 로그인",
                            style: TextStyle(
                              color: SUB_COLOR,
                              fontSize: 20, // 이 부분은 고정 크기로 유지
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
