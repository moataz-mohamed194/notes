import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ pages/add_or_edit_post.dart';
import '../../ domain/entities/posts_entities.dart';

class PostListWidget extends StatelessWidget {
  final List<PostsEntities> post;

  const PostListWidget({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: post.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(post[index].text.toString()),
          subtitle: Text(post[index].placeDateTime!.split('T')[0].toString()),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => AddOrEditPostPage(
                          isItEdit: true,
                          postOldData: post[index],
                        )));
          },
        );
      },
      separatorBuilder: (context, index) => Divider(thickness: 1),
    );
  }
}
