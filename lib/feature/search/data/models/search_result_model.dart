import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurse_space/feature/courses/data/models/course/course.dart';
import 'package:nurse_space/feature/professor/data/models/professor/professor.dart';

part 'search_result_model.g.dart';

@JsonSerializable()

class SearchResult {
  List<Course> courses;
  List<Professor> professors;



  SearchResult({
   required this.courses,
    required this.professors
  });



  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);



}

