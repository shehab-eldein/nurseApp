class Tag {
  int id;
  Map<String,dynamic> tag;

  Tag({
    required this.id,
    required this.tag,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      tag: json['tag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tag': tag,
    };
  }
}
