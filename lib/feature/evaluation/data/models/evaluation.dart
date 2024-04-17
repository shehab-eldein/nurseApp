
import 'package:json_annotation/json_annotation.dart';

part 'evaluation.g.dart';

@JsonSerializable(explicitToJson: true)
class Evaluation {
  int? courses;
  int? hours;
  int? courseTests;
  List<dynamic>? certificates;

  Evaluation({
    required this.courses,
    required this.hours,
    required this.courseTests,
    required this.certificates,
  });


  factory Evaluation.fromJson(Map<String, dynamic> json) =>
      _$EvaluationFromJson(json);

  Map<String, dynamic> toJson() => _$EvaluationToJson(this);

}