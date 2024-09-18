import 'package:flutter/material.dart';

class PersonalInfoAgreement extends StatelessWidget {
  final String title;
  const PersonalInfoAgreement({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("개인 정보 수집 및 이용 동의"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "‘온이프’는 사용자의 개인정보를 중요시하며, '개인정보 보호법' 등 관련 법령을 준수하고 있습니다. "
              "온이프는 개인정보 처리방침을 통해 사용자가 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, "
              "개인정보 보호를 위해 어떤 조치가 취해지고 있는지 알려드립니다.",
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            buildSectionTitle("1. 수집하는 개인정보 항목"),
            const SizedBox(height: 8.0),
            buildSectionContent("온이프는 서비스 이용을 위해 필요한 최소한의 개인정보만을 수집하고 있습니다."),
            const SizedBox(height: 8.0),
            buildBulletPoint(
                "필수 수집 항목: SNS 로그인 시 제공되는 정보 (이름, 이메일 주소, 프로필 사진 등), 앱 사용 데이터, 학교 및 반 이름"),
            const SizedBox(height: 24.0),
            buildSectionTitle("2. 개인정보의 수집 및 이용 목적"),
            const SizedBox(height: 8.0),
            buildSectionContent("온이프는 수집한 개인정보를 다음의 목적을 위해 이용합니다."),
            const SizedBox(height: 8.0),
            buildBulletPoint(
                "서비스 제공: 사용자 인증, 학교 및 반 정보 기반 서비스 제공, 앱 사용 데이터 분석 및 개선"),
            buildBulletPoint("고객 관리: 문의사항 처리"),
            const SizedBox(height: 24.0),
            buildSectionTitle("3. 개인정보의 보유 및 이용 기간"),
            const SizedBox(height: 8.0),
            buildBulletPoint(
                "보유 기간: 회원 탈퇴 시까지. 단, 관련 법령에 따라 보관해야 하는 경우 해당 법령에서 정한 기간 동안 보관"),
            buildBulletPoint("이용 기간: 회원 탈퇴 시까지"),
            const SizedBox(height: 24.0),
            buildSectionTitle("4. 개인정보의 제3자 제공"),
            const SizedBox(height: 8.0),
            buildSectionContent(
                "*온이프는 원칙적으로 사용자의 개인정보를 제3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.*"),
            const SizedBox(height: 8.0),
            buildBulletPoint("사용자가 사전에 동의한 경우"),
            buildBulletPoint(
                "법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우"),
            const SizedBox(height: 24.0),
            buildSectionTitle("5. 개인정보의 파기 절차 및 방법"),
            const SizedBox(height: 8.0),
            buildBulletPoint("파기 절차: 보유 기간이 경과된 개인정보는 즉시 파기됩니다."),
            buildBulletPoint(
                "파기 방법: 전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제하겠습니다."),
            const SizedBox(height: 24.0),
            buildSectionTitle("6. 이용자의 권리와 행사 방법"),
            const SizedBox(height: 8.0),
            buildBulletPoint(
                "이용자는 언제든지 자신의 개인정보를 조회하거나 수정할 수 있으며, 수집 및 이용에 대한 동의를 철회할 수 있습니다."),
            buildBulletPoint(
                "개인정보 조회, 수정 및 동의 철회를 위해서는 고객센터로 문의하시면 지체 없이 조치하겠습니다."),
            const SizedBox(height: 24.0),
            buildSectionTitle("7. 개인정보 보호 책임자"),
            const SizedBox(height: 8.0),
            buildBulletPoint("개인정보 보호 책임자 : [이지유]"),
            buildBulletPoint("연락처 : [jiyoo0320@gmail.com], [010-9188-3190]"),
            const SizedBox(
              height: 8.0,
            ),
            buildSectionContent(
                "* 온이프는 사용자의 개인정보를 안전하게 관리하며, 보호하기 위해 최선을 다하고 있습니다. 개인정보 관련 문의사항은 언제든지 개인정보 보호 책임자에게 문의해주시기 바랍니다 *")
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

  Widget buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 16.0,
      ),
    );
  }

  Widget buildBulletPoint(String text) {
    return Row(
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
    );
  }
}
