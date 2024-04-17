// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Professor _$ProfessorFromJson(Map<String, dynamic> json) => Professor(
      id: json['id'] as int,
      name: json['professors'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      about: json['about'] as String?,
      media: (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: json['stats'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ProfessorToJson(Professor instance) => <String, dynamic>{
      'id': instance.id,
      'professors': instance.name,
      'about': instance.about,
      'user': instance.user?.toJson(),
      'media': instance.media.map((e) => e.toJson()).toList(),
      'stats': instance.stats,
    };
