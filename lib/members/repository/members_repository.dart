import 'package:dio/dio.dart';
import 'package:flick_frontend/const/uri.dart';
import 'package:flick_frontend/members/model/isLogin_model.dart';
import 'package:flick_frontend/members/model/members_model.dart';
import 'package:retrofit/retrofit.dart';

part 'members_repository.g.dart';

@RestApi(baseUrl: '$BASE_URl/members')
abstract class MembersRepository {
  factory MembersRepository(Dio dio, {String baseUrl}) = _MembersRepository;
  // to do
  //1. 소셜 로그인 후 온보딩
  @POST('/onboarding')
  Future<Members> postMembers(@Body() Map<String, dynamic> body);

  //2. 첫 로그인 유무
  @GET('/first/login')
  Future<IsLoginResponse> checkFirstLogin();
}
