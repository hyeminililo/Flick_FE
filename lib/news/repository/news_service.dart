// NewsService 클래스
import 'package:flick_frontend/news/model/newsData_model.dart';
import 'package:flick_frontend/news/model/newsInfo_model.dart';
import 'package:flick_frontend/news/repository/news_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
        return []; // 빈 뉴스 리스트 반환
      }

      final response =
          await newsRepository.fetchNews(authorization: 'Bearer $token');
      print('News Api : ${response.statusCode}');

      if (response.statusCode != 200) {
        print(
            "[Error]: Failed to fetch news. StatusCode: ${response.statusCode}");
        return []; // 빈 뉴스 리스트 반환
      }

      // 데이터가 null인 경우 처리
      if (response.data == null) {
        print("[Error]: Response data is null");
        return []; // 빈 뉴스 리스트 반환
      }

      final NewsInfoResDtos newsData = response.data!;

      // newsInfoResDtos가 null인 경우 처리
      if (newsData.newsInfoResDtos == null) {
        print("[Error]: News data or news list is null.");
        return []; // 빈 뉴스 리스트 반환
      }

      final newsList = newsData.newsInfoResDtos;
      return newsList ?? []; // null이 아닐 때만 리스트 반환, null일 경우 빈 리스트
    } catch (e) {
      // 예외 처리 (네트워크 오류 등)
      print("[Error]: $e");
      return []; // 오류 발생 시 빈 뉴스 리스트 반환
    }
  }

  // 뉴스 상세 구현
  Future<List<NewsInfo>> fetchNewsDatailsList(int newsId) async {
    try {
      // 저장소에서 토큰을 읽어옴
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

      // 토큰이 null인 경우 처리
      if (token == null) {
        print("[Error]: Token is null");
        return []; // 빈 뉴스 리스트 반환
      }

      // 뉴스 상세 정보를 API에서 가져옴
      final response = await newsRepository.fetchNewsDetails(
        newsId,
        authorization: 'Bearer $token',
      );

      print('NewsDetails Api : ${response.statusCode}');

      // 응답 코드가 200이 아닌 경우 에러 처리
      if (response.statusCode != 200) {
        print(
            "[Error]: Failed to fetch newsDetails. StatusCode: ${response.statusCode}");
        return []; // 빈 뉴스 리스트 반환
      }

      // 데이터가 null인 경우 처리
      if (response.data == null) {
        print("[Error]: Response data is null");
        return []; // 빈 뉴스 리스트 반환
      }

      // 응답 데이터를 NewsInfoResDtos로 파싱
      final NewsInfoResDtos newsDtos = response.data!;

      // NewsInfoResDtos의 newsInfoResDtos 리스트가 null인 경우 처리
      if (newsDtos.newsInfoResDtos == null) {
        print("[Error]: News Details Data list is null.");
        return []; // 빈 뉴스 리스트 반환
      }

      // null이 아닌 뉴스 리스트 반환
      final newsList = newsDtos.newsInfoResDtos;
      return newsList ?? []; // newsList가 null일 경우 빈 리스트 반환
    } catch (e) {
      // 예외 처리 (네트워크 오류, 파싱 오류 등)
      print("[Error]: $e");
      return []; // 오류 발생 시 빈 뉴스 리스트 반환
    }
  }
}
