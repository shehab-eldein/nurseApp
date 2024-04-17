// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityImpl _$$CityImplFromJson(Map<String, dynamic> json) => _$CityImpl(
      id: json['id'] as int?,
      city: json['city'] as String?,
      description: json['description'] as String?,
      regionId: json['regionId'] as int?,
      teamId: json['teamId'] as int?,
      region: json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CityImplToJson(_$CityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'description': instance.description,
      'regionId': instance.regionId,
      'teamId': instance.teamId,
      'region': instance.region?.toJson(),
      'team': instance.team?.toJson(),
      'media': instance.media?.map((e) => e.toJson()).toList(),
    };
