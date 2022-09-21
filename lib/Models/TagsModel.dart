class TagsModel {
  String? tag;

  TagsModel.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
  }

  Map<String, dynamic> toMap() {
    return {
      'tag': tag,
    };
  }
}