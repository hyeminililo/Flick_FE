// 참여자 상태 클래스를 정의합니다.
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParticipantsState {
  final int count;
  final List<String> memberPictureUrls;

  ParticipantsState({required this.count, required this.memberPictureUrls});
}

// 참여자 상태를 관리하는 Notifier를 정의합니다.
class ParticipantsNotifier extends StateNotifier<ParticipantsState> {
  ParticipantsNotifier()
      : super(ParticipantsState(count: 0, memberPictureUrls: []));

  Future<void> fetchParticipants(int challengeId) async {
    // 서버에서 참여자 데이터 가져오는 로직
    var response = await fetchParticipantsData(challengeId);

    state = ParticipantsState(
      count: response['statusCode'] == 0
          ? response['data']['memberPictureUrls'].length
          : 0,
      memberPictureUrls:
          List<String>.from(response['data']['memberPictureUrls']),
    );
  }

  Future<Map<String, dynamic>> fetchParticipantsData(int challengeId) async {
    await Future.delayed(const Duration(seconds: 1)); // 비동기 처리
    return {
      "statusCode": 0,
      "message": "success",
      "data": {
        "memberPictureUrls": [
          "https://via.placeholder.com/150/FF0000/FFFFFF?text=User+1",
          "https://via.placeholder.com/150/00FF00/FFFFFF?text=User+2",
          "https://via.placeholder.com/150/0000FF/FFFFFF?text=User+3",
          "https://via.placeholder.com/150/FFFF00/FFFFFF?text=User+4",
          "https://via.placeholder.com/150/FF00FF/FFFFFF?text=User+5",
          "https://via.placeholder.com/150/00FFFF/FFFFFF?text=User+6",
        ]
      }
    };
  }
}

// 참여자 상태를 제공하는 Provider
final participantsProvider =
    StateNotifierProvider<ParticipantsNotifier, ParticipantsState>((ref) {
  return ParticipantsNotifier();
});
