// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      userType: json['userType'] as String?,
      cityId: json['cityId'] as int?,
      universityId: json['universityId'] as int?,
      teamId: json['teamId'] as int?,
      photo: json['photo'] as String?,
      roles: json['roles'] as List<dynamic>?,
      city: json['city'] as String?,
      university: json['university'] as String?,
      team: json['team'] as String?,
      media: json['media'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'userType': instance.userType,
      'cityId': instance.cityId,
      'universityId': instance.universityId,
      'teamId': instance.teamId,
      'photo': instance.photo,
      'roles': instance.roles,
      'city': instance.city,
      'university': instance.university,
      'team': instance.team,
      'media': instance.media,
    };
