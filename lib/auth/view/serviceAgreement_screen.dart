import 'package:flutter/material.dart';

class Serviceagreement extends StatelessWidget {
  final String title;

  const Serviceagreement({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("서비스 이용약관 동의"),
        backgroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Text(
                '제 1 조',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '플릭은 모든 사용자에게 쾌적한 환경을 제공하기 위해 노력합니다. 따라서 불쾌한 콘텐츠를 게시하거나 악의적인 행동을 하는 사용자는 서비스 이용이 제한되거나 계정이 정지될 수 있습니다.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                '제 2 조',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '본 서비스를 이용함에 있어서 다른 사용자에게 불쾌함을 주거나, 피해를 주는 행동을 금지합니다. 이를 위반할 경우, 즉각적인 조치를 취하며, 필요한 경우 법적인 절차를 밟을 수 있습니다.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                '제 3 조',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '본 서비스의 사용자는 서로를 존중하며, 불쾌한 콘텐츠를 게시하거나 악의적인 행동을 하지 않도록 약속해야 합니다. 이를 위반할 경우, 서비스 이용이 제한되거나 계정이 정지될 수 있습니다.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
