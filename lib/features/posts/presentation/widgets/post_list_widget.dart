import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import '../ pages/add_or_edit_post.dart';
import '../../ domain/entities/posts_entities.dart';

class PostListWidget extends StatelessWidget {
  final List<PostsEntities> post;
  final List<PostsEntities> post2;
  final TextEditingController searchController = TextEditingController();

  PostListWidget({Key? key, required this.post, required this.post2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: searchController,
          validator: (val) => val!.isEmpty == true ? 'must add the note' : null,
          decoration: const InputDecoration(
            labelText: 'Note',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.black26, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.black26, width: 0),
            ),
          ),
          onTap: () => showSearch(
            context: context,
            delegate: SearchPage<PostsEntities>(
              items: post2,
              searchLabel: 'Search people',
              suggestion: Center(
                child: Text('Filter people by name, surname or age'),
              ),
              failure: Center(
                child: Text('No person found :('),
              ),
              filter: (person) => [
                person.text,
                person.placeDateTime,
              ],
              builder: (person) => ListTile(
                title: Text(person.text.toString()),
                subtitle: Text(person.placeDateTime.toString()),
              ),
            ),
          ),
        ),

        Expanded(
          child: ListView.separated(
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
          ),
        ),
      ],
    );
  }
}
