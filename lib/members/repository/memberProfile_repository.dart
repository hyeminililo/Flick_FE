// import 'package:flick_frontend/members/model/memberInfo_model.dart';
// import 'package:flick_frontend/members/repository/members_repository.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flick_frontend/common/dio/apiResponse_model.dart';

// class MembersProfileRepository {
//   final MembersRepository membersRepository;
//   final FlutterSecureStorage storage;

//   MemberInfoModel? memberInfo;

//   MembersProfileRepository(this.membersRepository, this.storage);

//   Future<void> fetchMemberInfo() async {
//     final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

//     if (token == null) {
//       print("[Error]: Token is null");
//       return;
//     }

//     try {
//       final apiResponse = await membersRepository.fetchMemberInfo(
//         authorization: 'Bearer $token',
//       );
//       print('MemberInfo Status Code: ${apiResponse.statusCode}');

//       if (apiResponse.statusCode == 200) {
//         // apiResponse.data는 MemberInfoModel
//         memberInfo = apiResponse.data;
//         print('Fetched MemberInfo: $memberInfo');
//       } else {
//         print('[Warning]: Unexpected status code ${apiResponse.statusCode}');

//         throw Exception("예상치 못한 응답 코드: ${apiResponse.statusCode}");
//       }
//     } catch (e) {
//       print('[ERR]: 멤버 정보를 가져오는 과정에서 오류가 발생했습니다: $e');
//       throw Exception("멤버 정보 가져오기 실패: $e");
//     }
//   }

//   // Future<void> updateMemberInfo(MemberInfoModel updatedInfo) async {
//   //   final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

//   //   if (token == null) {
//   //     print("[Error]: Token is null");
//   //     return;
//   //   }

//   //   try {
//   //     final apiResponse = await membersRepository.updateMemberInfo(
//   //       updatedInfo,
//   //       authorization: 'Bearer $token',
//   //     );
//   //     print('Update MemberInfo Status Code: ${apiResponse.statusCode}');

//   //     if (apiResponse.statusCode == 200) {
//   //       memberInfo = apiResponse.data;
//   //       print('Updated MemberInfo: $memberInfo');
//   //     } else {
//   //       print('[Warning]: Unexpected status code ${apiResponse.statusCode}');
//   //     }
//   //   } catch (e) {
//   //     print('[ERR]: 멤버 정보를 업데이트하는 과정에서 오류가 발생했습니다: $e');
//   //   }
//   // }
// }
import 'package:flick_frontend/members/model/memberInfo_model.dart';
import 'package:flick_frontend/members/repository/members_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flick_frontend/common/dio/apiResponse_model.dart';

class MembersProfileRepository {
  final MembersRepository membersRepository;
  final FlutterSecureStorage storage;

  MemberInfoModel? memberInfo;

  MembersProfileRepository(this.membersRepository, this.storage);

  Future<void> fetchMemberInfo() async {
    final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

    if (token == null) {
      print("[Error]: Token is null");
      throw Exception("토큰이 존재하지 않습니다.");
    }

    try {
      final apiResponse = await membersRepository.fetchMemberInfo(
        authorization: 'Bearer $token',
      );
      print('MemberInfo Status Code: ${apiResponse.statusCode}');

      if (apiResponse.statusCode == 200) {
        // apiResponse.data는 MemberInfoModel
        memberInfo = apiResponse.data;
        print('Fetched MemberInfo: $memberInfo');
      } else {
        print('[Warning]: Unexpected status code ${apiResponse.statusCode}');
        throw Exception("예상치 못한 응답 코드: ${apiResponse.statusCode}");
      }
    } catch (e) {
      print('[ERR]: 멤버 정보를 가져오는 과정에서 오류가 발생했습니다: $e');
      throw Exception("멤버 정보 가져오기 실패: $e");
    }
  }

  Future<void> updateMemberInfo(MemberInfoModel updatedInfo) async {
    final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

    if (token == null) {
      print("[Error]: Token is null");
      throw Exception("토큰이 존재하지 않습니다.");
    }

    try {
      final apiResponse = await membersRepository.updateMemberInfo(
        updatedInfo,
        authorization: 'Bearer $token',
      );
      print('Update MemberInfo Status Code: ${apiResponse.statusCode}');

      if (apiResponse.statusCode == 200) {
        memberInfo = apiResponse.data;
        print('Updated MemberInfo: $memberInfo');
      } else {
        print('[Warning]: Unexpected status code ${apiResponse.statusCode}');
        throw Exception("예상치 못한 응답 코드: ${apiResponse.statusCode}");
      }
    } catch (e) {
      print('[ERR]: 멤버 정보를 업데이트하는 과정에서 오류가 발생했습니다: $e');
      throw Exception("멤버 정보 업데이트 실패: $e");
    }
  }
}
