import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../courses/data/models/team.dart';
import 'package:json_annotation/json_annotation.dart';

import '../city/city.dart';


//part '../university.freezed.dart';
part 'univeristy.g.dart';

@JsonSerializable(explicitToJson: true)
class University  {

  int? id;
  String? name;
  String? description;
  String? deletedAt;
  int? cityId;
  int? teamId;
  City? city;
  Team? team;

  University({
     this.id,
     this.name,
    this.description,
    this.deletedAt,
    this.cityId,
    this.teamId,
     this.city,
    this.team,
  });




  factory University.fromJson(Map<String, dynamic> json) =>
      _$UniversityFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityToJson(this);


  //
  // factory University.fromJson(Map<String, dynamic> json) {
  //   return University(
  //     id: json['id'],
  //     name: json['name'],
  //     description: json['description'],
  //     createdAt: json['created_at'],
  //     updatedAt: json['updated_at'],
  //     deletedAt: json['deleted_at'],
  //     cityId: json['city_id'],
  //     teamId: json['team_id'],
  //     city: City.fromJson(json['city']),
  //     team: json['team'],
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'description': description,
  //     'created_at': createdAt,
  //     'updated_at': updatedAt,
  //     'deleted_at': deletedAt,
  //     'city_id': cityId,
  //     'team_id': teamId,
  //     'city': city.toJson(),
  //     'team': team,
  //   };
  // }
}



