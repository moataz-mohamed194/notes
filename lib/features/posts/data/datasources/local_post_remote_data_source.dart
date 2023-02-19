
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import '../../ domain/entities/posts_entities.dart';
import '../../../../core/error/Exception.dart';
import '../models/post_model.dart';

abstract class LocalPostRemoteDataSource {
  Future<Unit> addPost(PostsEntities post);
  Future<Unit> updatePost(PostsEntities post);
  Future<List<PostModel>> getPost();
}

class LocalPostRemoteDataSourceImple extends LocalPostRemoteDataSource {
  @override
  Future<Unit> addPost(PostsEntities post) async {
    print('you added in the local');
    try {
      var addData = await Hive.openBox<PostsEntities>('Post0');
      var posts = PostsEntities()
        ..text = post.text
        ..placeDateTime = post.placeDateTime
        ..id = addData.length.toString()
        ..userId = post.userId;
      addData.add(posts);
      // ..name = valueMap['name'];
      print(addData.values.toList().runtimeType);
      return Future.value(unit);
    } catch (e) {
      throw OfflineException();
    }
  }

  @override
  Future<List<PostModel>> getPost() async {
    try {
      print('you get data from local');

      var addData = await Hive.openBox<PostsEntities>('Post0');
      print(addData);
      print(addData.runtimeType);

      if (addData.length > 0) {
        List<PostModel> postList = [];

        for (int i = 0; i < addData.length; i++) {
          PostsEntities? postsEntities = addData.getAt(i);
          PostModel postModel = PostModel(
            id: postsEntities!.id,
            placeDateTime: postsEntities!.placeDateTime,
            userId: postsEntities!.userId,
            text: postsEntities!.text,
          );
          postList.add(postModel);
        }
        return postList;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      throw OfflineException();
    }
  }

  @override
  Future<Unit> updatePost(PostsEntities post) async {
    print('you are in update local ');
    try {
      var addData = await Hive.openBox<PostsEntities>('Post0');
      print(addData);
      for (int i = 0; i < addData.length; i++) {
        PostsEntities? postsEntities = addData.getAt(i);
        if (post.id == postsEntities!.id) {
          postsEntities.text = post.text;
          postsEntities.placeDateTime = post.placeDateTime;
        }
      }
      print(addData.values);
      return Future.value(unit);
    } catch (e) {
      print(e);
      throw OfflineException();
    }
  }
}
