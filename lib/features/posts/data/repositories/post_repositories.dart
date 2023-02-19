import 'package:dartz/dartz.dart';
import 'package:notes/core/error/failures.dart';
import 'package:notes/features/posts/%20domain/entities/posts_entities.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ domain/repositories/post_repositorie.dart';
import '../../../../core/error/Exception.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/local_post_remote_data_source.dart';
import '../datasources/post_remote_data_source.dart';
import '../models/post_model.dart';

class PostRepositoriesImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final LocalPostRemoteDataSource localRemoteDataSource;
  final NetworkInfo networkInfo;

  PostRepositoriesImpl(
      {required this.remoteDataSource,
      required this.networkInfo,
      required this.localRemoteDataSource});

  @override
  Future<Either<Failures, Unit>> addPost(PostsEntities post) async {
    final PostModel postModel = PostModel(
        id: post.id,
        userId: post.userId,
        placeDateTime: post.placeDateTime,
        text: post.text);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? useLocal = prefs.getBool('useLocal');
    if (useLocal == true) {
      await localRemoteDataSource.addPost(postModel);
      return Right(unit);
    } else if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.addPost(postModel);
        return Right(unit);
      } on OfflineException {
        return Left(OfflineFailures());
      }
    } else {
      return Left(OfflineFailures());
    }
  }

  @override
  Future<Either<Failures, List<PostsEntities>>> getAllPosts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? useLocal = prefs.getBool('useLocal');
    if (useLocal == true) {
      final currentPost = await localRemoteDataSource.getPost();
      print(currentPost);
      return Right(currentPost);
    } else if (await networkInfo.isConnected) {
      try {
        final currentPost = await remoteDataSource.getPost();
        return Right(currentPost);
      } on OfflineException {
        return Left(OfflineFailures());
      }
    } else {
      return Left(OfflineFailures());
    }
  }

  @override
  Future<Either<Failures, Unit>> updatePost(PostsEntities post) async {
    final PostModel postModel = PostModel(
        id: post.id,
        userId: post.userId,
        placeDateTime: post.placeDateTime,
        text: post.text);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? useLocal = prefs.getBool('useLocal');
    if (useLocal == true) {
      await localRemoteDataSource.updatePost(postModel);
      return Right(unit);
    } else if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updatePost(postModel);
        return Right(unit);
      } on OfflineException {
        return Left(OfflineFailures());
      }
    } else {
      return Left(OfflineFailures());
    }
  }
}
