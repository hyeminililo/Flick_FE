import 'package:dio/dio.dart' hide Headers;
import 'package:flick_frontend/common/dio/apiResponse_model.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:flick_frontend/members/model/isLogin_model.dart';
import 'package:flick_frontend/members/model/memberInfo_model.dart';
import 'package:flick_frontend/members/model/members_model.dart';
// import 'package:retrofit/http.dart';

import 'package:retrofit/retrofit.dart';

part 'members_repository.g.dart';

@RestApi(baseUrl: '$BASE_URl/members')
abstract class MembersRepository {
  factory MembersRepository(Dio dio, {String baseUrl}) = _MembersRepository;

  @POST('/onboarding')
  Future<void> postMembers(@Body() Members member,
      {@Header('Authorization') String? authorization});

  @GET('/first/login')
  Future<IsLoginResponse> checkFirstLogin(
      {@Header('Authorization') String? authorization});

  @GET('/info')
  Future<ApiResponse<MemberInfoModel>> fetchMemberInfo(
      {@Header('Authorization') String? authorization});

  // @PATCH("/profile")
  // @MultiPart()
  // Future<ApiResponse<MemberInfoModel>> updateMemberInfo(
  //   @Part(name: 'memberInfoUpdateReqDto')
  //   String memberInfoUpdateReqDto, // JSON 문자열로 전송
  //   @Part(name: 'multipartFile') MultipartFile? multipartFile, // 이미지 파일
  //   @Header('Authorization') String? authorization,
  // );
}
