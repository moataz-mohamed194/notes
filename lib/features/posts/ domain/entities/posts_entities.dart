import 'package:equatable/equatable.dart';

class PostsEntities extends Equatable {
  String? text;
  String? placeDateTime;
  String? userId;
  String? id;

  PostsEntities({this.text, this.placeDateTime, this.userId, this.id});

  @override
  List<Object?> get props => [text, placeDateTime, userId, id];
}
