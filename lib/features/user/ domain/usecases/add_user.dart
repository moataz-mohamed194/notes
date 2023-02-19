import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/users_entities.dart';
import '../repositories/user_repositorie.dart';

class AddUser {
  final UserRepository repository;

  AddUser(this.repository);

  Future<Either<Failures, Unit>> call(UserEntities user) async {
    return await repository.addUser(user);
  }
}
