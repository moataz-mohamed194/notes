import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../ domain/entities/posts_entities.dart';
import '../../../../core/error/Exception.dart';
import '../../../../core/string/basic.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<Unit> addPost(PostsEntities post);
  Future<Unit> updatePost(PostsEntities post);
  Future<List<PostModel>> getPost();
}

class PostRemoteDataSourceImple extends PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImple({required this.client});

  @override
  Future<Unit> addPost(PostsEntities post) async {
    final body = {
      'Text': post.text.toString(),
      'PlaceDateTime': post.placeDateTime.toString(),
      'UserId': post.userId.toString(),
      'id': 0.toString()
    };
    try {
      final response =
          await client.post(Uri.parse(BASE_URL + '/notes/insert/'), body: body);

      if (response.statusCode == 200) {
        return Future.value(unit);
      } else {
        throw OfflineException();
      }
    } catch (e) {
      throw OfflineException();
    }
  }

  @override
  Future<List<PostModel>> getPost() async {
    final response = await client.get(Uri.parse(BASE_URL + "/notes/getall"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      try {
        final List decodeJson = json.decode(response.body) as List;
        final List<PostModel> postModels = decodeJson
            .map<PostModel>(
                (jsonPostModel) => PostModel.fromJson(jsonPostModel))
            .toList();
        return postModels;
      } catch (e) {
        throw OfflineException();
      }
    } else {
      throw OfflineException();
    }
  }

  @override
  Future<Unit> updatePost(PostsEntities post) async {
    final body = {
      'Text': post.text.toString(),
      'PlaceDateTime': post.placeDateTime.toString(),
      'UserId': post.userId.toString(),
      'id': post.id.toString()
    };
    final response =
        await client.post(Uri.parse(BASE_URL + '/notes/update'), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw OfflineException();
    }
  }
}
