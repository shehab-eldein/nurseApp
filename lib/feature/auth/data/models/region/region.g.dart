// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionImpl _$$RegionImplFromJson(Map<String, dynamic> json) => _$RegionImpl(
      id: json['id'] as int,
      region: Map<String, String?>.from(json['region'] as Map),
      deletedAt: json['deletedAt'] as String?,
      teamId: json['teamId'] as int?,
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RegionImplToJson(_$RegionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region': instance.region,
      'deletedAt': instance.deletedAt,
      'teamId': instance.teamId,
      'team': instance.team?.toJson(),
    };
