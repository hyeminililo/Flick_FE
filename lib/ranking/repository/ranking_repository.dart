import 'package:dio/dio.dart';
import 'package:flick_frontend/common/dio/apiResponse_model.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:flick_frontend/ranking/model/generalInfoResDto_model.dart';
import 'package:flick_frontend/ranking/model/studentRanking_model.dart';
import 'package:retrofit/retrofit.dart';

part 'ranking_repository.g.dart';

@RestApi(baseUrl: '$BASE_URl/ranking')
abstract class RankingRepository {
  factory RankingRepository(Dio dio, {String baseUrl}) = _RankingRepository;

  // @GET('/student')
  // Future<ApiResponse<StudentRanking>> fetchStudentRanking(
  //     {@Header('Authorization') String? authorization});
  @GET('/student')
  Future<ApiResponse<List<StudentRanking>>> fetchStudentRanking(
      {@Header('Authorization') String? authorization});

  @GET('/general') // 이거 바꾼거니 오류나면 이거 살피기,,
  Future<ApiResponse<GeneralRankingInfoResDto>> fetchGeneralRanking(
      {@Query("page") int page = 0,
      @Query("size") int size = 10,
      @Header('Authorization') String? authorization});
}
