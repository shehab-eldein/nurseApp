import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/model/media_model/media_model.dart';
import '../../../../../core/model/user_model/user.dart';



part 'professor.g.dart';

@JsonSerializable(explicitToJson: true)
class Professor {
  int id;
  @JsonKey(name: 'professors')
  String? name;

  String? about;
  User? user;
  List<Media> media;
  Map<String, dynamic>? stats;


  Professor({
    required this.id,
     this.name,
    this.user,
    this.about,
    required this.media,
    this.stats

  });

  factory Professor.fromJson(Map<String, dynamic> json) =>
      _$ProfessorFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessorToJson(this);


}
