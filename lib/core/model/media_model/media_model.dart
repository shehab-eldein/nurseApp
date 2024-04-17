import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_model.g.dart';

@JsonSerializable()

class Media {
  String? url;
  String? thumbnail;
  String? preview;
  String? originalUrl;
  String? previewUrl;

  Media({
    this.url,
    this.thumbnail,
    this.preview,
    this.originalUrl,
    this.previewUrl,
  });



  factory Media.fromJson(Map<String, dynamic> json) =>
      _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);



}

