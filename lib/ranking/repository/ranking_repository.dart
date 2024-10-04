import 'package:dio/dio.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:flick_frontend/ranking/model/studentResponse_model.dart';
import 'package:retrofit/retrofit.dart';

part 'ranking_repository.g.dart';

@RestApi(baseUrl: '$BASE_URl/ranking')
abstract class RankingRepository {
  factory RankingRepository(Dio dio, {String baseUrl}) = _RankingRepository;

  @GET('/student')
  Future<StudentRankingResponse> fetchStudentRanking(
      {@Header('Authorization') String? authorization});
}
