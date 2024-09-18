import 'package:flutter/material.dart';

class CommunityAgreement extends StatelessWidget {
  final String title;
  const CommunityAgreement({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("커뮤니티 이용 규칙 확인"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "[온이프]는 사용자들이 서로의 일상을 사진을 통해 공유할 수 있는 "
              "안전하고 즐거운 커뮤니티를 제공하기 위해 다음과 같은 이용규칙을 "
              "마련하였습니다. 사용자는 이 규칙을 준수하여야 하며, 위반 시 "
              "법적 처벌을 받을 수 있습니다.",
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            buildSectionTitle("1. 목적"),
            const SizedBox(height: 8.0),
            buildBulletPoint(
                "이 규칙은 사용자가 커뮤니티를 이용할 때 준수해야 할 기본적인 원칙을 정함으로써 모든 사용자가 안전하고 즐겁게 서비스를 이용할 수 있도록 하는 데 목적이 있습니다."),
            const SizedBox(height: 24.0),
            buildSectionTitle("2. 기본 원칙"),
            const SizedBox(height: 8.0),
            buildBulletPoint("존중: 다른 사용자에 대한 존중과 배려를 기반으로 커뮤니티 활동을 합니다."),
            buildBulletPoint("책임: 자신의 행위에 대한 책임을 지며, 타인의 권리를 침해하지 않습니다."),
            const SizedBox(height: 24.0),
            buildSectionTitle("3. 금지 행위"),
            const SizedBox(height: 8.0),
            buildBulletPoint("무단 배포 금지", [
              "다른 사용자가 업로드한 사진을 무단으로 저장, 복제, 배포하거나 제3자에게 공유하는 행위를 금지합니다.",
              "위반 시 관련 법령에 따라 민사 및 형사상의 법적 처벌을 받을 수 있습니다."
            ]),
            const SizedBox(height: 16.0),
            buildBulletPoint("저작권 침해 금지", [
              "타인의 저작물을 무단으로 업로드하거나 사용해서는 안 됩니다.",
              "저작권 침해 시 법적 책임을 지게 됩니다."
            ]),
            const SizedBox(height: 16.0),
            buildBulletPoint("부적절한 콘텐츠 금지", [
              "음란물, 폭력적인 내용, 혐오 표현 등 부적절한 콘텐츠를 업로드해서는 안 됩니다.",
              "해당 콘텐츠 발견 시 즉시 삭제되며, 경우에 따라 계정이 제한될 수 있습니다."
            ]),
            const SizedBox(height: 16.0),
            buildBulletPoint("사칭 및 개인정보 침해 금지", [
              "다른 사람을 사칭하거나 타인의 개인정보를 무단으로 수집, 이용하는 행위를 금지합니다.",
              "개인정보 침해 시 법적 처벌을 받을 수 있습니다."
            ]),
            const SizedBox(height: 24.0),
            buildSectionTitle("4. 커뮤니티 이용 시 유의사항"),
            const SizedBox(height: 8.0),
            buildBulletPoint("개인정보 보호: 자신의 개인정보를 타인에게 노출하지 않도록 주의합니다."),
            buildBulletPoint(
                "신고제도: 부적절한 콘텐츠나 규칙 위반 행위 발견 시, 신고 기능을 통해 회사에 알릴 수 있습니다."),
            buildBulletPoint("상호 존중: 서로의 의견을 존중하며, 건전한 커뮤니티 문화를 형성합니다."),
            const SizedBox(height: 24.0),
            buildSectionTitle("5. 규칙 위반 시 조치"),
            const SizedBox(height: 8.0),
            buildBulletPoint("경고: 첫 위반 시 경고 메시지를 발송합니다."),
            buildBulletPoint("일시 정지: 반복적인 위반 시 일정 기간 동안 커뮤니티 이용이 제한됩니다."),
            buildBulletPoint(
                "영구 정지: 중대한 위반 행위나 지속적인 규칙 위반 시 계정이 영구 정지될 수 있습니다."),
            buildBulletPoint(
                "법적 조치: 위반 행위가 법적 처벌의 대상이 될 경우, 관련 법령에 따라 민사 및 형사상의 법적 조치가 취해질 수 있습니다."),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildBulletPoint(String text, [List<String>? subPoints]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("• "),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
        if (subPoints != null)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: subPoints
                  .map((subPoint) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("• "),
                          Expanded(
                            child: Text(
                              subPoint,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ),
      ],
    );
  }
}
