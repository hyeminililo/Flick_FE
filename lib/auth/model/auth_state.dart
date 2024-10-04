import 'package:flick_frontend/auth/model/token_model.dart';

class AuthState {
  final TokenData? tokenData;
  AuthState({this.tokenData});

  AuthState copyWith({required TokenData tokenData}) {
    return AuthState(tokenData: tokenData);
  }
}
