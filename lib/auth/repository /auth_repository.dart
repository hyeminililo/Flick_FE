import 'package:dio/dio.dart';
import 'package:flick_frontend/auth/model/idToken_model.dart';
import 'package:flick_frontend/auth/model/tokenResponse_model.dart';
import 'package:flick_frontend/auth/model/token_model.dart';
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
  Future<TokenResponseModel> requestAuthToken(
      @Path("provider") String provider, @Body() Map<String, String> body);

  @POST('/token/access')
  Future<TokenData> requestReIssueAccessToken(@Body() Map<String, String> body);
}
