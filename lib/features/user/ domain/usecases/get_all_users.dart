import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/users_entities.dart';
import '../repositories/user_repositorie.dart';

class GetAllUser {
  final UserRepository repository;

  GetAllUser(this.repository);

  Future<Either<Failures, List<UserEntities>>> call() async {
    return await repository.getAllUsers();
  }
}
