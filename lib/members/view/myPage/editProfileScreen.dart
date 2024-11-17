import 'dart:io';
import 'package:flick_frontend/members/provider/member_state.dart';
import 'package:flick_frontend/members/provider/members_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  final String profileImage;
  const EditProfileScreen({super.key, required this.profileImage});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  XFile? selectedImage; // 선택된 이미지를 저장할 변수 추가
  late TextEditingController nicknameController; // 닉네임 컨트롤러

  @override
  void initState() {
    super.initState();
    // 닉네임 컨트롤러 초기화
    nicknameController = TextEditingController();
    // 프로필 정보 로드
    Future.microtask(() =>
        ref.read(membersProfileNotifierProvider.notifier).fetchMemberInfo());
  }

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final profileState = ref.watch(membersProfileNotifierProvider);

    // 에러 발생 시 SnackBar로 메시지 출력
    ref.listen<MemberProfileState>(membersProfileNotifierProvider,
        (previous, next) {
      next.maybeWhen(
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/images/editMyPage.png",
              width: screenWidth * 0.05,
              height: screenHeight * 0.05,
            ),
            const Text(' 내 프로필 수정'),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: profileState.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text("로딩 중입니다..."),
              ],
            ),
          ),
          loaded: (memberInfo) {
            // 닉네임 컨트롤러에 기본값 설정
            nicknameController.text = memberInfo.nickname;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 프로필 사진 구성
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: screenWidth * 0.3,
                        height: screenWidth * 0.3,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: ClipOval(
                          // 이미지 파일 선택 여부에 따른 조건부 렌더링
                          child: selectedImage == null
                              ? Image.network(
                                  memberInfo.picture ??
                                      "assets/images/default.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(selectedImage!.path),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      // 카메라 아이콘 클릭 시 이미지 선택 기능 추가
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery,
                            );

                            if (image != null) {
                              setState(() {
                                selectedImage = image;
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.camera_alt, size: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '닉네임',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                // 닉네임 입력 필드
                TextField(
                  controller: nicknameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: '닉네임을 입력하세요',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                  child: ElevatedButton(
                    // 닉네임 및 이미지 정보 업데이트
                    onPressed: () async {
                      final updatedMemberInfo = nicknameController.text;

                      // 선택된 이미지가 있으면 이미지 경로를 함께 전달
                      await ref
                          .read(membersProfileNotifierProvider.notifier)
                          .updateMemberInfo(
                            updatedMemberInfo,
                            selectedImage?.path != null
                                ? File(selectedImage!.path)
                                : null, // 이미지 경로와 닉네임 함께 전송
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.purple),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: screenHeight * 0.05,
                          vertical: screenWidth * 0.05),
                    ),
                    child: const Text(
                      '저장하기',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (message) => Center(child: Text('오류: $message')),
        ),
      ),
    );
  }
}
