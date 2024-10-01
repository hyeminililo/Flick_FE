import 'package:dio/dio.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:flick_frontend/news/model/newsInfo_model.dart';
import 'package:flick_frontend/news/model/newsResponse_model.dart';
import 'package:retrofit/retrofit.dart';

part 'news_repository.g.dart';

@RestApi(baseUrl: '{$BASE_URl}/news')
abstract class NewsRepository {
  factory NewsRepository(Dio dio, {String baseUrl}) = _NewsRepository;
  @GET('/')
  Future<NewsResponse> fetchNews();

  // 추후 문제 생기면 수정
  // @GET('/{newsId}')
  // Future<NewsResponse> fetchNewsDetails(@Path("newsId") int newsId);

  @GET('/{newsId}')
  Future<NewsInfo> fetchNewsDetails(@Path("newsId") int newsId); // NewsInfo로 변경
}
