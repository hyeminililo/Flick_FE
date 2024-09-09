import 'package:flick_frontend/auth/model/auth_state.dart';
import 'package:flick_frontend/auth/model/token_model.dart';
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
