
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import '../../ domain/entities/users_entities.dart';
import '../../../../core/error/Exception.dart';
import '../models/user_model.dart';

abstract class LocalUserRemoteDataSource {
  Future<Unit> addUser(UserEntities user);
  Future<Unit> deleteUser(UserEntities user);
  Future<List<UserModel>> getUsers();
}

class LocalUserRemoteDataSourceImple extends LocalUserRemoteDataSource {
  @override
  Future<Unit> addUser(UserEntities user) async {
    print('you added in the local');
    try {
      var addData = await Hive.openBox<UserEntities>('User');
      var users = UserEntities()
        ..intrestId = user.intrestId
        ..imageAsBase64 = user.imageAsBase64
        ..username = user.username
        ..password = user.password
        ..email = user.email;
      addData.add(users);
      print(addData.length);
      return Future.value(unit);
    } catch (e) {
      throw OfflineException();
    }
  }

  @override
  Future<Unit> deleteUser(UserEntities user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      print('you get data of users from local');

      var addData = await Hive.openBox<UserEntities>('User');
      print(addData.length);
      print(addData.runtimeType);

      if (addData.length > 0) {
        List<UserModel> userList = [];

        for (int i = 0; i < addData.length; i++) {
          UserEntities? userEntities = addData.getAt(i);
          UserModel userModel = UserModel(
            id: userEntities!.id,
            username: userEntities!.username,
            password: userEntities!.password,
            intrestId: userEntities!.intrestId,
            imageAsBase64: userEntities!.imageAsBase64,
            email: userEntities!.email,
          );
          userList.add(userModel);
        }
        return userList;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      throw OfflineException();
    }
  }
}
