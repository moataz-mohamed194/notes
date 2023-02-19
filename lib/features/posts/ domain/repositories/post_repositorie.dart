import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/posts_entities.dart';

abstract class PostRepository {
  Future<Either<Failures, List<PostsEntities>>> getAllPosts();
  Future<Either<Failures, Unit>> addPost(PostsEntities post);
  Future<Either<Failures, Unit>> updatePost(PostsEntities post);
}
