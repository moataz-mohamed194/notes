import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/users_entities.dart';
import '../repositories/user_repositorie.dart';

class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Future<Either<Failures, Unit>> call(UserEntities user) async {
    return await repository.deleteUser(user);
  }
}
