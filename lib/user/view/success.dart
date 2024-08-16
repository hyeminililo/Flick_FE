import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  final String userName;
  const Success({super.key, required this.userName});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // print(screenWidth);
    // print(screenHeight);

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.1,
          ),
          Icon(
            Icons.check_circle,
            color: const Color(0xff47D294),
            size: screenWidth * 0.30,
          ),
          SizedBox(
            height: screenHeight * 0.042,
          ),
          Text(
            "회원가입 성공! ",
            style: TextStyle(
                fontSize: setFontSize(screenWidth),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Text(
            "${widget.userName}님, 환영합니다!",
            style: TextStyle(fontSize: setFontSize(screenWidth) * 0.8),
          ),
          SizedBox(
            height: screenHeight * 0.38,
          ),
          ElevatedButton(
            onPressed: () {
              _alertSignUp(context, screenWidth, screenHeight);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff47D294),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.38, // 버튼 가로 크기를 동적으로 설정
                vertical: screenHeight * 0.023, // 버튼 세로 크기를 동적으로 설정
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // 버튼 모서리 둥글기 설정
              ),
            ),
            child: const Text(
              "시작하기",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    ));
  }

  double setFontSize(double screenWidth) => screenWidth > 600 ? 40 : 30;
}

Future<dynamic> _alertSignUp(
    BuildContext context, double screenWidth, double screenHeight) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Column(
        children: [
          Icon(Icons.check_circle,
              color: const Color(0xff47D294), size: screenWidth * 0.30),
          SizedBox(
            height: screenHeight * 0.07,
          ),
          Text(
            "회원가입 완료",
            style: TextStyle(
                fontSize: screenWidth > 600 ? 40 : 30,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      content: Text(
        "지금 바로 다양한\n챌린지에 참여해보세요.",
        style: TextStyle(
            color: const Color(0xff383838),
            fontSize: screenWidth > 600 ? 10 : 5,
            fontFamily: "Pretendard"),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff47D294),
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.38, // 버튼 가로 크기를 동적으로 설정
                vertical: screenHeight * 0.023),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // 버튼 모서리 둥글기 설정
            ),
          ),
          child: Text(
            "확인",
            style: TextStyle(
                fontSize: screenWidth > 600 ? 30 : 20, color: Colors.white),
          ),
        )
      ],
    ),
  );
}

// Container(
//                 width: 350,
//                 height: 56,
//                 decoration: const BoxDecoration(
//                     color: Colors.yellow,
//                     borderRadius: BorderRadius.all(Radius.circular(10))),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.check_circle,
//                       color: Colors.white,
//                     ),
//                     SizedBox(
//                       width: 8.0,
//                     ),
//                     Expanded(
//                       child: Text(
//                         textAlign: TextAlign.center,
//                         "카카오로 3초 만에 로그인 하기.",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 10,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     )
//                   ],
//                 ))