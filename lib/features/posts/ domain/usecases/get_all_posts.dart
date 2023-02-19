import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/posts_entities.dart';
import '../repositories/post_repositorie.dart';

class GetAllPosts {
  final PostRepository repository;

  GetAllPosts(this.repository);

  Future<Either<Failures, List<PostsEntities>>> call() async {
    return await repository.getAllPosts();
  }
}
