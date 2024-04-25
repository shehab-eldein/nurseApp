import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nurse_space/feature/courses/data/models/lesson/lesson.dart';
import 'package:nurse_space/feature/courses/data/models/tag.dart';
import 'package:nurse_space/feature/courses/data/models/test_info/test_info.dart';

import '../../../../../core/model/media_model/media_model.dart';
import '../../../../categories/data/models/category/category.dart';
import '../../../../professor/data/models/professor/professor.dart';


part 'course.g.dart';

@JsonSerializable(explicitToJson: true,includeIfNull: true)
class Course {
  int? id;
  @JsonKey(name: 'course_name')
  Map<String, dynamic> courseName;
  int? free;
  @JsonKey(name: 'course_price')
  String? coursePrice;
   @JsonKey(name: 'course_requirments')
   Map<String, String?>? courseRequirments;
   @JsonKey(name: 'user_learn')
   Map<String, dynamic>? userLearn;
  @JsonKey(name: 'course_duration')
  double? courseDuration;
  @JsonKey(name: 'course_language')
  String? courseLanguage;

  List<Lesson> lessons;
  // @JsonKey(name: 'course_summary')
  // String? courseSummary;
  // @JsonKey(name: 'course_description')
  //  Map<String, dynamic>? courseDescription;

  Map<String, dynamic>? stats;


  @JsonKey(name: 'tests_info')
  List<TestInfo>  testsInfoList;
  List<Media> media;
  //Vidio
  CategoryOfCourse? category;
  List<Tag>? tags;
  Professor? professor;
  //TEAM


  Course({
     this.id,
     required this.courseName,
    this.stats,
     this.free,
    this.coursePrice,
   // this.courseRequirments,
    this.userLearn,
    this.courseDuration,
    this.courseLanguage,
   // this.courseDescription,
   required this.media,
    this.tags,
    required this.testsInfoList,
     this.category,
     this.professor,
    required this.lessons

  });

  factory Course.fromJson(Map<String, dynamic> json) =>
      _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);



}




