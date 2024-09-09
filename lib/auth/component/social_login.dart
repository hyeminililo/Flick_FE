import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class SocialLogin {
  Future<bool> login(WidgetRef ref);
  Future<bool> logout();
}
