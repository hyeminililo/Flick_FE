// NewsService를 제공하는 Provider
import 'package:dio/dio.dart';
import 'package:flick_frontend/news/model/newsInfo_model.dart';
import 'package:flick_frontend/news/repository/news_repository.dart';
import 'package:flick_frontend/news/repository/news_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final newsServiceProvider = Provider<NewsService>((ref) {
  final newsRepository = ref.watch(newsRepositoryProvider);
  const storage = FlutterSecureStorage();
  return NewsService(newsRepository, storage);
});

// 뉴스 리스트를 fetch하는 FutureProvider (최종적으로 사용되는 Provider)
final newsListProvider = FutureProvider<List<NewsInfo>>((ref) async {
  final newsService = ref.watch(newsServiceProvider);
  return await newsService.fetchNewsList();
});

// NewsRepository Provider (뉴스 데이터를 API에서 가져오는 역할)
final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return NewsRepository(Dio());
});
