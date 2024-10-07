// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memberPictureUrls_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberPictureUrls _$MemberPictureUrlsFromJson(Map<String, dynamic> json) =>
    MemberPictureUrls(
      memberPictureUrls: (json['memberPictureUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MemberPictureUrlsToJson(MemberPictureUrls instance) =>
    <String, dynamic>{
      'memberPictureUrls': instance.memberPictureUrls,
    };
