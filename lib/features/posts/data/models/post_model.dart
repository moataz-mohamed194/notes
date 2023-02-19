import '../../ domain/entities/posts_entities.dart';

class PostModel extends PostsEntities {
  PostModel({
    String? text,
    String? placeDateTime,
    String? userId,
    String? id,
  }) : super(text: text, placeDateTime: placeDateTime, id: id, userId: userId);
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'] ?? '',
        text: json['text'] ?? '',
        placeDateTime: json['placeDateTime'] ?? '',
        userId: json['userId'] ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['placeDateTime'] = this.placeDateTime;
    data['userId'] = this.userId;
    data['id'] = this.id;
    return data;
  }
}
