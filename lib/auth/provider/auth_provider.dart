import 'package:flick_frontend/auth/model/auth_state.dart';
import 'package:flick_frontend/auth/model/token_model.dart';
import 'package:flick_frontend/auth/repository/auth_repository.dart';
import 'package:flick_frontend/common/dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider() : super(AuthState());

  void updateToken(TokenData tokenData) {
    state = state.copyWith(tokenData: tokenData);
  }

  void logout() {
    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
  return AuthProvider();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider); // Dio 인스턴스를 가져옴
  return AuthRepository(dio); // AuthRepository 인스턴스 생성
});
