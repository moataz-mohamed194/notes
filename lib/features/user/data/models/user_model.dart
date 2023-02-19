import '../../ domain/entities/users_entities.dart';

class UserModel extends UserEntities {
  UserModel({
    String? email,
    String? password,
    String? imageAsBase64,
    String? intrestId,
    String? username,
    String? id,
  }) : super(
            username: username,
            intrestId: intrestId,
            id: id,
            imageAsBase64: imageAsBase64,
            password: password,
            email: email);
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] ?? '',
        email: json['email'] ?? '',
        password: json['password'] ?? '',
        intrestId: json['intrestId'] ?? '',
        username: json['username'] ?? '',
        imageAsBase64: json['imageAsBase64'] ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['imageAsBase64'] = this.imageAsBase64;
    data['intrestId'] = this.intrestId;
    data['id'] = this.id;
    return data;
  }
}
