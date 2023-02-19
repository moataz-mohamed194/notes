import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'posts_entities.g.dart';

@HiveType(typeId: 0)
class PostsEntities extends HiveObject {
  @HiveField(0)
  String? text;

  @HiveField(1)
  String? placeDateTime;

  @HiveField(2)
  String? userId;

  @HiveField(3)
  String? id;

  PostsEntities({this.text, this.placeDateTime, this.userId, this.id});

  @override
  List<Object?> get props => [text, placeDateTime, userId, id];
}
