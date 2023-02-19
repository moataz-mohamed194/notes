import 'package:equatable/equatable.dart';

class UserEntities extends Equatable {
  String? username;
  String? password;
  String? email;
  String? imageAsBase64;
  String? intrestId;
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
