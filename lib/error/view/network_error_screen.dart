import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

class NetworkErrorScreen extends StatefulWidget {
  const NetworkErrorScreen({super.key});

  @override
  State<NetworkErrorScreen> createState() => _NetworkErrorScreenState();
}

class _NetworkErrorScreenState extends State<NetworkErrorScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/Error_Image_network.png",
                height: screenHeight * 0.20, width: screenWidth * 0.3),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const Text(
              "네트워크에 연결할 수 없어요",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                fontFamily: "Pretendard",
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const Text(
              "네트워크 연결 상태를 확인해주세요",
              style: TextStyle(
                fontSize: 5.0,
                color: Colors.grey,
                fontFamily: "Pretendard",
              ),
            ),
            SizedBox(
              height: screenHeight * 0.35,
            ),
            Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                ))
          ],
        ),
      ),
    );
  }
}
