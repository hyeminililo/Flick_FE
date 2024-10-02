import 'package:flick_frontend/news/model/newsData_model.dart';
import 'package:flick_frontend/news/model/newsInfo_model.dart';
import 'package:flick_frontend/news/repository/news_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// NewsService 클래스
class NewsService {
  final NewsRepository newsRepository;
  final FlutterSecureStorage storage;

  NewsService(this.newsRepository, this.storage);

  // 토큰을 읽어 뉴스 리스트를 불러오는 메서드
  Future<List<NewsInfo>> fetchNewsList() async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

      // 토큰이 null인 경우 처리
      if (token == null) {
        print("[Error]: Token is null");
        return []; // 기본 뉴스 리스트 반환
      }

      final response =
          await newsRepository.fetchNews(authorization: 'Bearer $token');
      print('News Api : ${response.statusCode}');

      if (response.statusCode != 200) {
        print(
            "[[Error]]: Failed to fetch news. StatusCode: ${response.statusCode}");
        return []; // 기본 뉴스 리스트 반환
      }

      final NewsInfoResDtos newsData = response.data!;

      if (newsData.newsInfoResDtos == null) {
        print("[[Error]]: News data or news list is null.");
        return []; // 기본 뉴스 리스트 반환
      }

      final newsList = newsData.newsInfoResDtos;

      return newsList!;
    } catch (e) {
      // 예외 처리 (네트워크 오류 등)
      print("[Error]: $e");
      return []; // 오류 발생 시 기본 뉴스 리스트 반환
    }
  }

  // 기본 뉴스 리스트를 반환하는 메서드
}
