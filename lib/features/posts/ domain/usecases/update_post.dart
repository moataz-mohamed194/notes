import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/posts_entities.dart';
import '../repositories/post_repositorie.dart';

class UpdatePost {
  final PostRepository repository;

  UpdatePost(this.repository);

  Future<Either<Failures, Unit>> call(PostsEntities post) async {
    return await repository.updatePost(post);
  }
}
