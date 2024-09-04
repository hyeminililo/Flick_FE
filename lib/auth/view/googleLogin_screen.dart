import 'package:dio/dio.dart';
import 'package:flick_frontend/auth/repository%20/auth_repository.dart';
import 'package:flick_frontend/const/uri.dart';
import 'package:flick_frontend/members/view_model/googleLogin_viewModel.dart';
import 'package:flutter/material.dart';

class GoogleLoginScreen extends StatefulWidget {
  const GoogleLoginScreen({super.key, required this.title});

  final String title;

  @override
  State<GoogleLoginScreen> createState() => _GoogleLoginScreenState();
}

class _GoogleLoginScreenState extends State<GoogleLoginScreen> {
  // final viewModel = MainViewModel(KakaoLogin());
  late final AuthRepository authRepository;
  late final GoogleLogin googleLogin;

  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    authRepository = AuthRepository(dio, baseUrl: BASE_URl);
    googleLogin = GoogleLogin(authRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Google Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  await googleLogin.login();
                  setState(() {});
                },
                child: const Text("Login")),
            ElevatedButton(
                onPressed: () async {
                  await googleLogin.logout();
                  setState(() {});
                },
                child: const Text("Logout")),
          ],
        ),
      ),
    );
  }
}
