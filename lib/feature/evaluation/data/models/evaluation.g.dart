// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evaluation _$EvaluationFromJson(Map<String, dynamic> json) => Evaluation(
      courses: json['courses'] as int?,
      hours: json['hours'] as int?,
      courseTests: json['courseTests'] as int?,
      certificates: json['certificates'] as List<dynamic>?,
    );

Map<String, dynamic> _$EvaluationToJson(Evaluation instance) =>
    <String, dynamic>{
      'courses': instance.courses,
      'hours': instance.hours,
      'courseTests': instance.courseTests,
      'certificates': instance.certificates,
    };
