import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurse_space/feature/courses/data/models/team.dart';


part 'region.g.dart';
part 'region.freezed.dart';

@freezed
class Region with _$Region {

@JsonSerializable(explicitToJson: true)
  const factory Region ({


    required int id,
    required Map<String, String?> region,

    String? deletedAt,
    int? teamId,
    Team? team,

  }) = _Region;

  factory Region.fromJson(Map<String,dynamic> json) => _$RegionFromJson(json);



}

//   Region({
//     required this.id,
//     required this.region,
//     required this.createdAt,
//     required this.updatedAt,
//     this.deletedAt,
//     this.teamId,
//     this.team,
//   });
//
//   factory Region.fromJson(Map<String, dynamic> json) {
//     return Region(
//       id: json['id'],
//       region: Map<String, String?>.from(json['region']),
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       deletedAt: json['deleted_at'],
//       teamId: json['team_id'],
//       team: json['team'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'region': region,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//       'deleted_at': deletedAt,
//       'team_id': teamId,
//       'team': team,
//     };
//   }
// }


