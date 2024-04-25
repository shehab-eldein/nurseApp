// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as int?,
      courseName: json['course_name'] as Map<String, dynamic>,
      stats: json['stats'] as Map<String, dynamic>?,
      free: json['free'] as int?,
      coursePrice: json['course_price'] as String?,
      userLearn: json['user_learn'] as Map<String, dynamic>?,
      courseDuration: (json['course_duration'] as num?)?.toDouble(),
      courseLanguage: json['course_language'] as String?,
      media: (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      testsInfoList: (json['tests_info'] as List<dynamic>)
          .map((e) => TestInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] == null
          ? null
          : CategoryOfCourse.fromJson(json['category'] as Map<String, dynamic>),
      professor: json['professor'] == null
          ? null
          : Professor.fromJson(json['professor'] as Map<String, dynamic>),
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..courseRequirments =
          (json['course_requirments'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'course_name': instance.courseName,
      'free': instance.free,
      'course_price': instance.coursePrice,
      'course_requirments': instance.courseRequirments,
      'user_learn': instance.userLearn,
      'course_duration': instance.courseDuration,
      'course_language': instance.courseLanguage,
      'lessons': instance.lessons.map((e) => e.toJson()).toList(),
      'stats': instance.stats,
      'tests_info': instance.testsInfoList.map((e) => e.toJson()).toList(),
      'media': instance.media.map((e) => e.toJson()).toList(),
      'category': instance.category?.toJson(),
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
      'professor': instance.professor?.toJson(),
    };
