
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/model/media_model/media_model.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryOfCourse {
  int id;
  Map<String, String> name;
  List<Media> media;
  //Description
  //Image



  CategoryOfCourse({
    required this.id,
    required this.name,
    required this.media

  });

  factory CategoryOfCourse.fromJson(Map<String, dynamic> json) =>
      _$CategoryOfCourseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryOfCourseToJson(this);


}
