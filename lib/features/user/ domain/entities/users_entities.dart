import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'users_entities.g.dart';

@HiveType(typeId: 1)
class UserEntities extends HiveObject {
  @HiveField(0)
  String? username;

  @HiveField(1)
  String? password;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? imageAsBase64;

  @HiveField(4)
  String? intrestId;

  @HiveField(5)
  String? id;

  UserEntities(
      {this.username,
      this.password,
      this.email,
      this.imageAsBase64,
      this.intrestId,
      this.id});
  @override
  List<Object?> get props =>
      [username, password, email, imageAsBase64, intrestId, id];
}
