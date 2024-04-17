
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)

class User {
  int? id;
  String name;
  String email;
  String? phone;
  String? password;
  String? userType;
  int? cityId;
  int? universityId;
  int? teamId;
  String? photo;
  List<dynamic>? roles;
  String? city;
  String? university;
  String? team;
  List<dynamic>? media;

  User({
     this.id,
    required this.name,
    required this.email,
    this.password,
    this.phone,
    this.userType,
    this.cityId,
    this.universityId,
    this.teamId,
    this.photo,
    this.roles,
    this.city,
    this.university,
    this.team,
    this.media,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


}