import 'package:dio/dio.dart';
import 'package:flick_frontend/common/dio/apiResponse_model.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:flick_frontend/ranking/model/generalReponse_model.dart';
import 'package:flick_frontend/ranking/model/studentRanking_model.dart';
import 'package:flick_frontend/ranking/model/studentResponse_model.dart';
import 'package:retrofit/retrofit.dart';

part 'ranking_repository.g.dart';

@RestApi(baseUrl: '$BASE_URl/ranking')
abstract class RankingRepository {
  factory RankingRepository(Dio dio, {String baseUrl}) = _RankingRepository;

  @GET('/student')
  Future<ApiResponse<StudentRanking>> fetchStudentRanking(
      {@Header('Authorization') String? authorization});

  @GET('/general')
  Future<ApiResponse<GeneralRankingResponse>> fetchGeneralRanking(
      @Query("page") int page, @Query("size") int size,
      {@Header('Authorization') String? authorization});
}
