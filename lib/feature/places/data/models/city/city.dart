import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurse_space/feature/auth/data/models/region/region.dart';
import 'package:nurse_space/feature/courses/data/models/team.dart';

import '../../../../../core/model/media_model/media_model.dart';
part 'city.freezed.dart';
part 'city.g.dart';

@freezed
class City with _$City {

  @JsonSerializable(explicitToJson: true)
  const factory City({

     int? id,
     String? city,
    String? description,
     int? regionId,
    int? teamId,
    //dynamic image,
    Region? region,
    Team? team,
    List<Media>? media,

}) = _City;

  factory City.fromJson(Map<String,dynamic> json) => _$CityFromJson(json);

}





