import 'package:dio/dio.dart';
import 'package:flick_frontend/challenge/model/picture/images_model.dart';
import 'package:flick_frontend/common/dio/apiResponse_model.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:retrofit/retrofit.dart';

part 'challengeImageUpload_repository.g.dart';

@RestApi(baseUrl: '$BASE_URl/images')
abstract class ChallengeImageUploadRepository {
  factory ChallengeImageUploadRepository(Dio dio, {String baseUrl}) =
      _ChallengeImageUploadRepository;

  @POST('/upload/{challengeId}')
  @MultiPart()
  Future<ApiResponse<List<ImageUrls>>> uploadChallengeImages({
    @Path('challengeId') required int challengeId,
    @Query('month') required int month,
    @Query('day') required int day,
    @Header('Authorization') required String authorization,
    @Part(name: 'multipartFiles') required List<MultipartFile> files,
  });
}
