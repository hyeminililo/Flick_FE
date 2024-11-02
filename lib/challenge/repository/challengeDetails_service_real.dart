import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/repository/challenge_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ChallengeDetailsService {
  final ChallengeRepository challengeRepository;
  final FlutterSecureStorage storage;

  ChallengeDetailsService(this.challengeRepository, this.storage);

  Future<ChallengeInfo?> fetchOpenDtails(int challengeId) async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');
      if (token == null) {
        print("[Error]: Token is null");
      }

      final response = await challengeRepository.fetchDetailsChallenge(
        challengeId: challengeId,
        authorization: 'Bearer $token',
      );
      print('ChallengeDetails Api : ${response.statusCode}');

      if (response.statusCode != 200) {
        print(
            "[Error]: Failed to fetch challengeDetails. StatusCode: ${response.statusCode}");
      }

      final ChallengeInfo challengeInfo = response.data;
      return challengeInfo;
    } catch (e) {
      print("[Error]: $e");
    }
    return null;
  }
}
