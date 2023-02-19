import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../ domain/entities/users_entities.dart';
import '../../../../core/error/Exception.dart';
import '../../../../core/string/basic.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<Unit> addUser(UserEntities user);
  Future<Unit> deleteUser(UserEntities user);
  Future<List<UserModel>> getUser();
}

class UserRemoteDataSourceImple extends UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImple({required this.client});

  @override
  Future<Unit> addUser(UserEntities user) async {
    String body =
        '{"Username": "${user.username.toString()}","Password": "${user.password.toString()}","Email": "${user.email.toString()}","ImageAsBase64": "${user.imageAsBase64.toString()}","IntrestId": "${user.intrestId.toString()}"}';
    try {
      final response = await client.post(
        Uri.parse(BASE_URL + '/users/insert'),
        body: body,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return Future.value(unit);
      } else {
        throw OfflineException();
      }
    } catch (e) {
      throw OfflineException();
    }
  }

  @override
  Future<Unit> deleteUser(UserEntities user) async {
    String body =
        '{"Username": "${user.username.toString()}","Password": "${user.password.toString()}","Email": "${user.email.toString()}","ImageAsBase64": "${user.imageAsBase64.toString()}","IntrestId": "${user.intrestId.toString()}"}';

    final response = await client.post(
      Uri.parse(BASE_URL + '/users/insert'),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw OfflineException();
    }
  }

  @override
  Future<List<UserModel>> getUser() async {
    final response = await client.get(Uri.parse(BASE_URL + "/users/getall"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      try {
        final List decodeJson = json.decode(response.body) as List;
        final List<UserModel> userModels = decodeJson
            .map<UserModel>(
                (jsonUserModel) => UserModel.fromJson(jsonUserModel))
            .toList();
        return userModels;
      } catch (e) {
        throw OfflineException();
      }
    } else {
      throw OfflineException();
    }
  }
}
