import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart' as di;

import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display_widget.dart';
import '../bloc/add_get_cubit.dart';
import '../bloc/post_state.dart';
import '../widgets/post_list_widget.dart';
import 'add_or_edit_post.dart';

class GetAllPostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6200EE),
        title: Text('Notes'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ],
      ),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(context),
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: BlocProvider(
            create: (context) => context.read<AddGetCubit>()..fetchData(),
            child: BlocBuilder<AddGetCubit, AddUpdateGetPostState>(
                builder: (context, state) {
              print(state);
              if (state is LoadingPostsState) {
                return LoadingWidget();
              } else if (state is LoadedPostsState) {
                return Container(
                  child: PostListWidget(post: state.posts),
                );
              }
              return Container();
            })));
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xff6200EE),
      onPressed: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => AddOrEditPostPage(
                      isItEdit: false,
                    )));
      },
      child: Icon(Icons.add),
    );
  }
}
