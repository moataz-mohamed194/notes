import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/posts_entities.dart';
import '../repositories/post_repositorie.dart';

class AddPost {
  final PostRepository repository;

  AddPost(this.repository);

  Future<Either<Failures, Unit>> call(PostsEntities post) async {
    return await repository.addPost(post);
  }
}
