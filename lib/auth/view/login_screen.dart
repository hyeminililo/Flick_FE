import 'package:dio/dio.dart';
import 'package:flick_frontend/auth/repository%20/auth_repository.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:flick_frontend/members/view_model/googleLogin_viewModel.dart';
import 'package:flick_frontend/members/view_model/kakaoLogin_viewModel.dart';
import 'package:flick_frontend/members/view_model/mainKakao_viewModel.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final AuthRepository authRepository;
  late final GoogleLogin googleLogin;
  late final MainViewModel kakaoLogin;

  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    authRepository = AuthRepository(dio, baseUrl: BASE_URl);
    googleLogin = GoogleLogin(authRepository);
    kakaoLogin = MainViewModel(KakaoLogin(authRepository));
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery로 화면의 크기를 가져옴.
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    String userName = kakaoLogin.user?.kakaoAccount?.profile?.nickname ?? '';

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
              //to do : 1.카카오 로그인 메소드 병합
              onPressed: () async {
                await kakaoLogin.login();
                setState(() {});

                print(userName);
              },
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
              //to do : 1.구글 로그인 메소드 병합
              onPressed: () async {
                await googleLogin.login();
                setState(() {});
              },
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
