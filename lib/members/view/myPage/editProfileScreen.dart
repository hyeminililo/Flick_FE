import 'dart:io';

import 'package:flick_frontend/members/provider/member_state.dart';
import 'package:flick_frontend/members/provider/members_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// class EditProfileScreen extends ConsumerWidget {
//   final String profileImage;
//   const EditProfileScreen({super.key, required this.profileImage});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     // 현재 프로필 상태를 가져옴
//     final profileState = ref.watch(membersProfileNotifierProvider);

//     // 상태 변화 감지 리스너 설정: 에러 상태일 때 스낵바로 에러 메시지 출력
//     ref.listen<MemberProfileState>(membersProfileNotifierProvider,
//         (previous, next) {
//       next.maybeWhen(
//         error: (message) {
//           // 에러 상태 발생 시, 스낵바로 메시지 표시
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(message)),
//           );
//         },
//         orElse: () {},
//       );
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Image.asset(
//               "assets/images/editMyPage.png",
//               width: screenWidth * 0.05,
//               height: screenHeight * 0.05,
//             ),
//             const Text(' 내 프로필 수정'),
//           ],
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.05), // 화면 너비의 5% 패딩
//         child: profileState.when(
//           initial: () {
//             // 상태가 초기일 때 비동기적으로 데이터를 불러옴
//             Future.microtask(() => ref
//                 .read(membersProfileNotifierProvider.notifier)
//                 .fetchMemberInfo());
//             return const Center(child: CircularProgressIndicator());
//           },
//           loading: () => const Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircularProgressIndicator(),
//                 SizedBox(height: 20),
//                 Text("로딩 중입니다..."),
//               ],
//             ),
//           ),
//           loaded: (memberInfo) {
//             // 닉네임을 관리할 컨트롤러를 생성
//             final nicknameController =
//                 TextEditingController(text: memberInfo.nickname);

//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // 프로필 사진 구성
//                 Center(
//                   child: Stack(
//                     alignment: Alignment.bottomRight,
//                     children: [
//                       Container(
//                         width: screenWidth * 0.3, // 프로필 사진 크기
//                         height: screenWidth * 0.3, // 프로필 사진 크기
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.grey[300], // 배경색
//                         ),

//                         child: ClipOval(
//                           child: Image.network(
//                             memberInfo.picture ??
//                                 "assets/images/default.png", // 기본 프로필 사진
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       // 카메라 아이콘
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: GestureDetector(
//                           onTap: () async {
//                             final ImagePicker picker = ImagePicker();
//                             final XFile? image = await picker.pickImage(
//                               source: ImageSource.gallery, // 갤러리에서 선택
//                             );

//                             if (image != null) {
//                               //To do  선택한 이미지가 있을 경우
//                               // 이미지 업로드 로직 추가

//                               uploadImage(image.path);
//                             }
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(5),
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black12,
//                                   blurRadius: 5,
//                                   offset: Offset(0, 2),
//                                 ),
//                               ],
//                             ),
//                             child: const Icon(Icons.camera_alt, size: 20),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   '닉네임',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 10),
//                 // 닉네임 입력 필드
//                 TextField(
//                   controller: nicknameController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                     hintText: '닉네임을 입력하세요',
//                     hintStyle: const TextStyle(color: Colors.grey),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Spacer(), // 아래쪽 여백 확보
//                 Container(
//                   width: double.infinity, // 버튼이 가득 차게
//                   padding: EdgeInsets.symmetric(
//                       vertical: screenHeight * 0.03), // 수직 패딩 증가
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       // 저장하기 버튼 클릭 시 행동
//                       final updatedMemberInfo = memberInfo.copyWith(
//                         nickname: nicknameController.text, // 닉네임 업데이트
//                       );
//                       await ref
//                           .read(membersProfileNotifierProvider.notifier)
//                           .updateMemberInfo(updatedMemberInfo);
//                       print("저장된 정보: ${updatedMemberInfo.nickname}");
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green, // 배경색
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10), // 모서리 둥글게
//                         side: const BorderSide(color: Colors.purple), // 테두리 색상
//                       ),
//                       padding: EdgeInsets.symmetric(
//                           horizontal: screenHeight * 0.05,
//                           vertical: screenWidth * 0.05), // 수평 패딩 증가
//                     ),
//                     child: const Text(
//                       '저장하기',
//                       style: TextStyle(
//                           color: Colors.white, fontSize: 18), // 텍스트 색상 및 크기
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//           error: (message) => Center(child: Text('오류: $message')),
//         ),
//       ),
//     );
//   }
// }

// void uploadImage(String imagePath) {
//   // 이미지 업로드 로직 구현
//   print('업로드할 이미지 경로: $imagePath');
//   // 여기에 API 호출 등을 추가하여 이미지를 서버에 업로드
// }
class EditProfileScreen extends ConsumerWidget {
  final String profileImage;
  const EditProfileScreen({super.key, required this.profileImage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          initial: () {
            // 데이터를 불러오기 위한 비동기 처리
            Future.microtask(() => ref
                .read(membersProfileNotifierProvider.notifier)
                .fetchMemberInfo());
            return const Center(child: CircularProgressIndicator());
          },
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
            // 닉네임을 관리할 컨트롤러 생성
            final nicknameController =
                TextEditingController(text: memberInfo.nickname);

            // 선택한 이미지 파일을 저장할 변수 추가 (수정)
            XFile? selectedImage;

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
                          // 이미지 파일 선택 여부에 따른 조건부 렌더링 (수정)
                          child: selectedImage == null
                              ? Image.network(
                                  memberInfo.picture ??
                                      "assets/images/default.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(selectedImage.path),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      // 카메라 아이콘 클릭 시 이미지 선택 기능 추가 (수정)
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
                              selectedImage = image;
                              ref
                                  .read(membersProfileNotifierProvider.notifier)
                                  .updateMemberInfo(
                                      memberInfo.copyWith(
                                          nickname: nicknameController.text),
                                      selectedImage!.path); // 선택한 이미지 경로 전송
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
                    // 닉네임 및 이미지 정보 업데이트 (수정)
                    onPressed: () async {
                      final updatedMemberInfo = memberInfo.copyWith(
                        nickname: nicknameController.text,
                      );
                      await ref
                          .read(membersProfileNotifierProvider.notifier)
                          .updateMemberInfo(updatedMemberInfo,
                              selectedImage?.path ?? ''); // 이미지 경로와 닉네임 함께 전송
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
