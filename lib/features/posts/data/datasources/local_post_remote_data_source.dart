import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../ domain/entities/posts_entities.dart';
import '../../../../core/error/Exception.dart';
import '../../../../core/string/basic.dart';
import '../models/post_model.dart';

abstract class LocalPostRemoteDataSource {
  Future<Unit> addPost(PostsEntities post);
  Future<Unit> updatePost(PostsEntities post);
  Future<List<PostModel>> getPost();
}

class LocalPostRemoteDataSourceImple extends LocalPostRemoteDataSource {

  @override
  Future<Unit> addPost(PostsEntities post) async {      throw OfflineException();

  }

  @override
  Future<List<PostModel>> getPost() async {      throw OfflineException();

  }

  @override
  Future<Unit> updatePost(PostsEntities post) async {
    throw OfflineException();
  }
}
