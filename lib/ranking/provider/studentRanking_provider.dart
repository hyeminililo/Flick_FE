// RankingService를 통해 학생 랭킹 데이터를 불러오는 Provider 생성
import 'package:flick_frontend/ranking/model/studentRanking_model.dart';
import 'package:flick_frontend/ranking/provider/generalRanking_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentRankingProvider =
    FutureProvider<List<StudentRanking>>((ref) async {
  final rankingService = ref.watch(rankingServiceProvider);
  return await rankingService.fetchStudentRankingList();
});
