// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestInfo _$TestInfoFromJson(Map<String, dynamic> json) => TestInfo(
      questionsCount: json['questions_count'] as int?,
      correctAnswers: json['correct_answers'] as int?,
      wrongAnswers: json['wrong_answers'] as int?,
    );

Map<String, dynamic> _$TestInfoToJson(TestInfo instance) => <String, dynamic>{
      'questions_count': instance.questionsCount,
      'correct_answers': instance.correctAnswers,
      'wrong_answers': instance.wrongAnswers,
    };
