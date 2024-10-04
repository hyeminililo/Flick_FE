// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsInfo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsInfo _$NewsInfoFromJson(Map<String, dynamic> json) => NewsInfo(
      newsId: (json['newsId'] as num).toInt(),
      title: json['title'] as String,
      broadcastingCompany: json['broadcastingCompany'] as String,
      date: json['date'] as String,
      contents: json['contents'] as String,
      url: json['url'] as String?,
      picture: json['picture'] as String?,
      viewCount: (json['viewCount'] as num).toInt(),
      likeCount: (json['likeCount'] as num).toInt(),
      isLike: json['isLike'] as bool,
    );

Map<String, dynamic> _$NewsInfoToJson(NewsInfo instance) => <String, dynamic>{
      'newsId': instance.newsId,
      'title': instance.title,
      'broadcastingCompany': instance.broadcastingCompany,
      'date': instance.date,
      'contents': instance.contents,
      'url': instance.url,
      'picture': instance.picture,
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
      'isLike': instance.isLike,
    };
