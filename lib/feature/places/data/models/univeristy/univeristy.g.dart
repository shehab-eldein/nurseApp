// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'univeristy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

University _$UniversityFromJson(Map<String, dynamic> json) => University(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      deletedAt: json['deletedAt'] as String?,
      cityId: json['cityId'] as int?,
      teamId: json['teamId'] as int?,
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UniversityToJson(University instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'deletedAt': instance.deletedAt,
      'cityId': instance.cityId,
      'teamId': instance.teamId,
      'city': instance.city?.toJson(),
      'team': instance.team?.toJson(),
    };
