import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:searchable_listview/searchable_listview.dart';
import '../ pages/add_or_edit_post.dart';
import '../../ domain/entities/posts_entities.dart';

class PostListWidget extends StatelessWidget {
  final PostsEntities post;

  PostListWidget({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///TODO:first way
        // TextFormField(
        //   controller: searchController,
        //   validator: (val) => val!.isEmpty == true ? 'must add the note' : null,
        //   decoration: const InputDecoration(
        //     labelText: 'Search',
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(10)),
        //       borderSide: BorderSide(color: Colors.black26, width: 0),
        //     ),
        //     enabledBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(10)),
        //       borderSide: BorderSide(color: Colors.black26, width: 0),
        //     ),
        //   ),
        //   onTap: () => showSearch(
        //     context: context,
        //     delegate: SearchPage<PostsEntities>(
        //       items: post2,
        //       searchLabel: 'Search people',
        //       suggestion: Center(
        //         child: Text('Filter people by name, surname or age'),
        //       ),
        //       failure: Center(
        //         child: Text('No Notes found :('),
        //       ),
        //       filter: (person) => [
        //         person.text,
        //         person.placeDateTime,
        //       ],
        //       builder: (person) => ListTile(
        //         title: Text(person.text.toString()),
        //         subtitle: Text(person.placeDateTime.toString()),
        //       ),
        //     ),
        //   ),
        // ),
        ///TODO: second way
        // Expanded(
        //   child: SearchableList<PostsEntities>(
        //     initialList: post2,
        //     builder: (PostsEntities user) => Text('${user.text}'),
        //     filter: (value) => post2.where((element) => element.text.toString().toLowerCase().contains(value),).toList(),
        //     // emptyWidget:  const EmptyView(),
        //     inputDecoration: InputDecoration(
        //       labelText: "Search Actor",
        //       fillColor: Colors.white,
        //       focusedBorder: OutlineInputBorder(
        //         borderSide: const BorderSide(
        //           color: Colors.blue,
        //           width: 1.0,
        //         ),
        //         borderRadius: BorderRadius.circular(10.0),
        //       ),
        //     ),
        //   ),
        // ),
        // Expanded(
        //   child: ListView.separated(
        //     itemCount: post.length,
        //     itemBuilder: (context, index) {
        //       return
                ListTile(
                title: Text(post.text.toString()),
                subtitle: Text(post.placeDateTime!.split('T')[0].toString()),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AddOrEditPostPage(
                                isItEdit: true,
                                postOldData: post,
                              )));
                },
              )
            // },
        //     separatorBuilder: (context, index) => Divider(thickness: 1),
        //   ),
        // ),
      ],
    );
  }
}

// class UserItem {
//   final PostsEntities user;
//
//   UserItem({required PostsEntities user});
// }
