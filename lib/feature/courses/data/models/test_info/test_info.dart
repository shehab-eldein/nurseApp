import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_info.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class TestInfo {
  @JsonKey(name: 'questions_count')
  int? questionsCount;
  @JsonKey(name: 'correct_answers')
  int? correctAnswers;

  @JsonKey(name: 'wrong_answers')

  int? wrongAnswers;

  TestInfo({
    this.questionsCount,
    this.correctAnswers,
    this.wrongAnswers,
  });

  factory TestInfo.fromJson(Map<String, dynamic> json) =>
      _$TestInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TestInfoToJson(this);
}
