// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryOfCourse _$CategoryOfCourseFromJson(Map<String, dynamic> json) =>
    CategoryOfCourse(
      id: json['id'] as int,
      name: Map<String, String>.from(json['name'] as Map),
      media: (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryOfCourseToJson(CategoryOfCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'media': instance.media.map((e) => e.toJson()).toList(),
    };
