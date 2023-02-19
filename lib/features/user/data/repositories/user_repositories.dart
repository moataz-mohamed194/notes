import 'package:dartz/dartz.dart';
import 'package:notes/core/error/failures.dart';
import 'package:notes/features/posts/%20domain/entities/posts_entities.dart';

import '../../ domain/entities/users_entities.dart';
import '../../ domain/repositories/user_repositorie.dart';
import '../../../../core/error/Exception.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/user_model.dart';

class UserRepositoriesImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoriesImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failures, Unit>> addUser(UserEntities user) async {
    final UserModel userModel = UserModel(
        id: user.id,
        email: user.email,
        password: user.password,
        imageAsBase64: user.imageAsBase64,
        intrestId: user.intrestId,
        username: user.username);
    if (await networkInfo.isConnected) {
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
    if (await networkInfo.isConnected) {
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
    if (await networkInfo.isConnected) {
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
