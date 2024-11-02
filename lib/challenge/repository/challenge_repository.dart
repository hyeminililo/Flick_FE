import 'package:dio/dio.dart';
import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/model/challenge_model.dart';
import 'package:flick_frontend/challenge/model/picture/images_model.dart';
import 'package:flick_frontend/challenge/model/picture/memberPictureUrls_model.dart';
import 'package:flick_frontend/common/dio/apiResponse_model.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:retrofit/retrofit.dart';

part 'challenge_repository.g.dart';

@RestApi(baseUrl: '$BASE_URl/challenges')
abstract class ChallengeRepository {
  factory ChallengeRepository(Dio dio, {String baseUrl}) = _ChallengeRepository;

  @GET('')
  Future<ApiResponse<Challenge>> fetchOpenChallenge(
      {@Header('Authorization') String? authorization});

  @GET('/{challengeId}')
  Future<ApiResponse<ChallengeInfo>> fetchDetailsChallenge({
    @Path('challengeId') required int challengeId,
    @Header('Authorization') String? authorization,
  });

// 여기에 타입을 보내야하는지 모르겠음
  @GET('/my')
  Future<ApiResponse<Challenge>> fetchMyChallenge({
    @Header('Authorization') String? authorization,
  });

// 만약 나중에 구현이 어려우면 그냥 2개의 모델로 선언가능
  @GET('member/picture/{challengeId}')
  Future<ApiResponse<MemberPictureUrls>> fetchUserChallengeAuthImages({
    @Path('challengeId') required int challengeId,
    @Query('month') required int month,
    @Query('day') required int day,
    @Header('Authorization') String? authorization,
  });

  @GET('image/{challengeId}')
  Future<ApiResponse<ImageUrls>> fetchChallengeImages({
    @Path('challengeId') required int challengeId,
    @Query('month') required int month,
    @Query('day') required int day,
    @Header('Authorization') String? authorization,
  });

  @POST('/leave/{challengeId}')
  Future<ApiResponse> leaveChallenge({
    @Path('challengeId') required int challengeId,
    @Header('Authorization') String? authorization,
  });

  @POST('/join/{challengeId}')
  Future<ApiResponse> joinChallenge({
    @Path('challengeId') required int challengeId,
    @Header('Authorization') String? authorization,
  });
}
