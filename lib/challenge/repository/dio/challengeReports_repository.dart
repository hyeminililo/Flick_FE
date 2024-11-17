import 'package:dio/dio.dart';
import 'package:flick_frontend/common/dio/apiResponse_model.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'challengeReports_repository.g.dart';

@RestApi(baseUrl: '$BASE_URl/reports/image')
abstract class ChallengeReportsRepository {
  factory ChallengeReportsRepository(Dio dio, {String baseUrl}) =
      _ChallengeReportsRepository;

  @POST('/{imageId}') // 지금 안 보여서 일단 apiRepsonte만 받게 해놓음 나중에 수정 해야할 수 있음
  Future<ApiResponse> reportsChallenge({
    @Path('imageId') required int imageId,
    @Header('Authorization') String? authorization,
  });
}
