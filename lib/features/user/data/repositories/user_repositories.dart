import 'package:dartz/dartz.dart';
import 'package:notes/core/error/failures.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ domain/entities/users_entities.dart';
import '../../ domain/repositories/user_repositorie.dart';
import '../../../../core/error/Exception.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/local_user_remote_data_source.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/user_model.dart';

class UserRepositoriesImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final LocalUserRemoteDataSource localRemoteDataSource;

  UserRepositoriesImpl(
      {required this.localRemoteDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failures, Unit>> addUser(UserEntities user) async {
    final UserModel userModel = UserModel(
        id: user.id,
        email: user.email,
        password: user.password,
        imageAsBase64: user.imageAsBase64,
        intrestId: user.intrestId,
        username: user.username);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? useLocal = prefs.getBool('useLocal');
    if (useLocal == true) {
      await localRemoteDataSource.addUser(userModel);
      return Right(unit);
    } else if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.addUser(userModel);
        return Right(unit);
      } on OfflineException {
        return Left(OfflineFailures());
      }
    } else {
      return Left(OfflineFailures());
    }
  }

  @override
  Future<Either<Failures, Unit>> deleteUser(UserEntities user) async {
    final UserModel userModel = UserModel(
        id: user.id,
        email: user.email,
        password: user.password,
        imageAsBase64: user.imageAsBase64,
        intrestId: user.intrestId,
        username: user.username);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? useLocal = prefs.getBool('useLocal');
    if (useLocal == true) {
      await localRemoteDataSource.deleteUser(userModel);
      return Right(unit);
    } else if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteUser(userModel);
        return Right(unit);
      } on OfflineException {
        return Left(OfflineFailures());
      }
    } else {
      return Left(OfflineFailures());
    }
  }

  @override
  Future<Either<Failures, List<UserEntities>>> getAllUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? useLocal = prefs.getBool('useLocal');
    if (useLocal == true) {
      final currentUser = await localRemoteDataSource.getUsers();
      return Right(currentUser);
    } else if (await networkInfo.isConnected) {
      try {
        final currentUser = await remoteDataSource.getUser();
        return Right(currentUser);
      } on OfflineException {
        return Left(OfflineFailures());
      }
    } else {
      return Left(OfflineFailures());
    }
  }
}
