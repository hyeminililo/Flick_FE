import 'package:flick_frontend/news/model/newsInfo_model.dart';
import 'package:flick_frontend/news/provider/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsDetailsProvider =
    FutureProvider.family<List<NewsInfo>, int>((ref, newsId) async {
  final newsService = ref.watch(newsServiceProvider);
  return await newsService.fetchNewsDatailsList(newsId);
});
