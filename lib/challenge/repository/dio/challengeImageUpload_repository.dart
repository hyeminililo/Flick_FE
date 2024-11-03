import 'package:dio/dio.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:retrofit/retrofit.dart';

part 'challengeImageUpload_repository.g.dart';

@RestApi(baseUrl: '$BASE_URl/images')
abstract class ChallengeImageUploadRepository {
  factory ChallengeImageUploadRepository(Dio dio, {String baseUrl}) =
      _ChallengeImageUploadRepository;

  // 챌린지 업로드 -> 추가적으로 mutipartFile를 만들어야할지.. 고민,,
  @POST('/upload/{challengeId}')
  Future<void> uploadChallengeImages({
    @Path('challengeId') required int challengeId,
    @Header('Authorization') String? authorization,
  });
}
