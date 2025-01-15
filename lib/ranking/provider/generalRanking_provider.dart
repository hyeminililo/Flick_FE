import 'package:dio/dio.dart';
import 'package:flick_frontend/members/model/memberInfo_model.dart';
import 'package:flick_frontend/ranking/model/studentRanking_model.dart';
import 'package:flick_frontend/ranking/repository/ranking_repository.dart';
import 'package:flick_frontend/ranking/repository/ranking_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// 다른 곳에서 사용할 프로바이더
final rankingServiceProvider = Provider<RankingService>((ref) {
  final rankingRepository = ref.watch(rankingRepositoryProvider);
  const storage = FlutterSecureStorage();
  return RankingService(rankingRepository, storage);
});

// (최종적으로 사용되는 Provider)
final rankingListProvider = FutureProvider<List<MemberInfoModel>>((ref) async {
  final rankingService = ref.watch(rankingServiceProvider);
  return await rankingService.fetchGeneralRankingList();
});

// 랭킹 데이터를 API에서 가져오는 역할)
final rankingRepositoryProvider = Provider<RankingRepository>((ref) {
  return RankingRepository(Dio());
});

// RankingService를 통해 학생 랭킹 데이터를 불러오는 Provider 생성
final studentRankingProvider =
    FutureProvider<List<StudentRanking>>((ref) async {
  final rankingService = ref.watch(rankingServiceProvider);
  return await rankingService.fetchStudentRankingList();
});
