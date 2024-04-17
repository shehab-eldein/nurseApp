import 'package:json_annotation/json_annotation.dart';


part 'nameIdModel.g.dart';

@JsonSerializable()
class NameId {

  int id;
  String name;


  NameId({
   required this.id,
    required this.name,

  });


  factory NameId.fromJson(Map<String, dynamic> json) =>
      _$NameIdFromJson(json);

  Map<String, dynamic> toJson() => _$NameIdToJson(this);
}