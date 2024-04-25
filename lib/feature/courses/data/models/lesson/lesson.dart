import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurse_space/feature/courses/data/models/team.dart';

import '../../../../../core/model/media_model/media_model.dart';

part 'lesson.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Lesson {
  int id;
  Map<String, String>? name;
  Map<String, dynamic>? description;
  num? lessonDuration;
  Map<String, String?>? courseSummary;
  Map<String, String?>? course_description;
  int? intro;
  int? free;
  int? courseNameId;
  int? courseLanguageId;
  int? teamId;
 // String? video;
  //String? pdf;
  Map<String, String>? courseName;

  // String courseLanguage;
  Team? team;
  List<Media>? media;

  Lesson({
    required this.id,
    required this.name,
    required this.description,
    required this.lessonDuration,
    this.courseSummary,
    this.course_description,
    required this.intro,
    required this.free,
    required this.courseNameId,
    required this.courseLanguageId,
    required this.teamId,
   // required this.video,
    //required this.pdf,
    required this.courseName,
    required this.team,
    required this.media,
  });


  factory Lesson.fromJson(Map<String, dynamic> json) =>
      _$LessonFromJson(json);

  Map<String, dynamic> toJson() => _$LessonToJson(this);


}
