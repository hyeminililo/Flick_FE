// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _NewsRepository implements NewsRepository {
  _NewsRepository(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    //http 부터 api까지 중괄호 쳐져 있었음
    // '{https://flick-api.shop/api}/news'
    baseUrl ??= 'https://flick-api.shop/api/news';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<NewsResponse> fetchNews() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<NewsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late NewsResponse _value;
    try {
      _value = NewsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  // @override
  // Future<NewsResponse> fetchNewsDetails(int newsId) async {
  //   final _extra = <String, dynamic>{};
  //   final queryParameters = <String, dynamic>{};
  //   final _headers = <String, dynamic>{};
  //   const Map<String, dynamic>? _data = null;
  //   final _options = _setStreamType<NewsResponse>(Options(
  //     method: 'GET',
  //     headers: _headers,
  //     extra: _extra,
  //   )
  //       .compose(
  //         _dio.options,
  //         '/${newsId}',
  //         queryParameters: queryParameters,
  //         data: _data,
  //       )
  //       .copyWith(
  //           baseUrl: _combineBaseUrls(
  //         _dio.options.baseUrl,
  //         baseUrl,
  //       )));
  //   final _result = await _dio.fetch<Map<String, dynamic>>(_options);
  //   late NewsResponse _value;
  //   try {
  //     _value = NewsResponse.fromJson(_result.data!);
  //   } on Object catch (e, s) {
  //     errorLogger?.logError(e, s, _options);
  //     rethrow;
  //   }
  //   return _value;
  // }

  // 추후 문제 발생하면 수정하자
  @override
  Future<NewsInfo> fetchNewsDetails(int newsId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<NewsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/${newsId}', // 해당 뉴스 ID로 요청
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));

    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late NewsResponse _response;
    try {
      _response = NewsResponse.fromJson(_result.data!); // NewsResponse로 파싱
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options); // 오류 처리
      rethrow;
    }

    // `NewsResponse`의 `data`는 `List<NewsInfo>`이므로, `newsId`로 해당 뉴스 항목을 찾아 반환
    final newsItem = _response.data?.firstWhere(
      (news) => news.newsId == newsId, // newsId에 맞는 뉴스 찾기
      orElse: () => throw Exception("News not found"), // 없을 경우 예외 처리
    );

    if (newsItem != null) {
      return newsItem; // 찾은 뉴스 반환
    } else {
      throw Exception('News not found'); // 뉴스가 없을 경우 예외 처리
    }
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
