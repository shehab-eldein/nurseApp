// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      id: json['id'] as int,
      name: (json['name'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      description: (json['description'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      lessonDuration: json['lessonDuration'] as num?,
      courseSummary: (json['courseSummary'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      course_description:
          (json['course_description'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      intro: json['intro'] as int?,
      free: json['free'] as int?,
      courseNameId: json['courseNameId'] as int?,
      courseLanguageId: json['courseLanguageId'] as int?,
      teamId: json['teamId'] as int?,
      courseName: (json['courseName'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'lessonDuration': instance.lessonDuration,
      'courseSummary': instance.courseSummary,
      'course_description': instance.course_description,
      'intro': instance.intro,
      'free': instance.free,
      'courseNameId': instance.courseNameId,
      'courseLanguageId': instance.courseLanguageId,
      'teamId': instance.teamId,
      'courseName': instance.courseName,
      'team': instance.team?.toJson(),
      'media': instance.media?.map((e) => e.toJson()).toList(),
    };
