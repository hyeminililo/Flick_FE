import 'package:dio/dio.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:flick_frontend/news/model/newsResponse_model.dart';
import 'package:retrofit/retrofit.dart';

part 'news_repository.g.dart';

@RestApi(baseUrl: '{$BASE_URl}/news')
abstract class NewsRepository {
  factory NewsRepository(Dio dio, {String baseUrl}) = _NewsRepository;
  @GET('/')
  Future<NewsResponse> fetchNews(
      {@Header('Authorization') String? authorization});

  @GET('/{newsId}')
  Future<NewsResponse> fetchNewsDetails(@Path("newsId") int newsId,
      {@Header('Authorization') String? authorization});
}
