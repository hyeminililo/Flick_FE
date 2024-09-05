import 'package:dio/dio.dart';
import 'package:flick_frontend/auth/model/idToken_model.dart';
import 'package:flick_frontend/auth/model/tokenResponse_model.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repository.g.dart';

@RestApi(baseUrl: BASE_URl)
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;

  @GET('/{provider}/id-token')
  Future<IdTokenModel> requestIdToken(
      @Path("provider") String provider, @Query("code") String code);

  @POST('/{provider}/token')
  Future<TokenResponseModel> requestAccessToken(
      @Path("provider") String provider, @Body() Map<String, String> body);

  @POST('/{provider}/token')
  Future<TokenResponseModel> requestRefrechToken(
      @Path("provider") String provider, @Body() Map<String, String> body);

  @POST('/token/access')
  Future<TokenResponseModel> requestReIssueAccessToken(
      @Body() Map<String, String> body);
}
