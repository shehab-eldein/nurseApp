// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      url: json['url'] as String?,
      thumbnail: json['thumbnail'] as String?,
      preview: json['preview'] as String?,
      originalUrl: json['originalUrl'] as String?,
      previewUrl: json['previewUrl'] as String?,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'preview': instance.preview,
      'originalUrl': instance.originalUrl,
      'previewUrl': instance.previewUrl,
    };
