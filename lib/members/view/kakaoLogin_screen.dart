import 'package:dio/dio.dart';
import 'package:flick_frontend/auth/repository%20/auth_repository.dart';
import 'package:flick_frontend/const/uri.dart';
import 'package:flick_frontend/members/view_model/kakao_login.dart';
import 'package:flick_frontend/members/view_model/main_kakao_view.dart';
import 'package:flutter/material.dart';

class KakaoLoginScreen extends StatefulWidget {
  const KakaoLoginScreen({super.key, required this.title});

  final String title;

  @override
  State<KakaoLoginScreen> createState() => _KakaoLoginScreenState();
}

class _KakaoLoginScreenState extends State<KakaoLoginScreen> {
  late final MainViewModel viewModel;
  late final AuthRepository authRepository;
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    authRepository = AuthRepository(dio, baseUrl: BASE_URl);
    viewModel = MainViewModel(KakaoLogin(authRepository));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
            Text(viewModel.user?.kakaoAccount?.profile?.nickname ?? ''),
            Text(
              viewModel.isLogined,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () async {
                  await viewModel.login();
                  setState(() {});
                },
                child: const Text("Login")),
            ElevatedButton(
                onPressed: () async {
                  await viewModel.logout();
                  setState(() {});
                },
                child: const Text("Logout")),
          ],
        ),
      ),
    );
  }
}
