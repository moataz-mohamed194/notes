import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/users_entities.dart';

abstract class UserRepository {
  Future<Either<Failures, List<UserEntities>>> getAllUsers();
  Future<Either<Failures, Unit>> addUser(UserEntities user);
  Future<Either<Failures, Unit>> deleteUser(UserEntities user);
}
