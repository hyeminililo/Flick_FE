import 'package:flick_frontend/env.dart';

const String REDIRECT_URI = 'https://www.onef-flick.store';
const String AUTHORIZATION_URL = 'https://kauth.kakao.com/oauth/authorize';
const String ID_TOKEN_URI = 'https://kauth.kakao.com/oauth/token';
const String TOKEN_URI = 'https://kauth.kakao.com/oauth/token';
const String BASE_URl = 'https://flick-api.shop/api';
const String url =
    '$AUTHORIZATION_URL?client_id=client_id&redirect_uri=$REDIRECT_URI&response_type=';
String CLIENT_ID = Env.client_id;
