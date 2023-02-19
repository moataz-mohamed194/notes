import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/features/posts/presentation/widgets/post_list_widget.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../ domain/entities/posts_entities.dart';

class SearchPage extends StatelessWidget{
  final List<PostsEntities> post2;

  const SearchPage({super.key, required this.post2});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SearchableList<PostsEntities>(
      initialList: post2,
      builder: (PostsEntities user) => PostListWidget(post: user,),
      filter: (value) => post2.where((element) => element.text.toString().toLowerCase().contains(value),).toList(),
      // emptyWidget:  const EmptyView(),
      inputDecoration: InputDecoration(
        labelText: "Search Note",
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
  
}