import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../choose_database/settings_page.dart';
import '../../../user/presentation/ pages/add_user.dart';
import '../../../user/presentation/ pages/get_all_user.dart';
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
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AddOrEditUserPage()));
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SettingPage()));
              },
              icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => GetAllUserPage()));
              },
              icon: Icon(Icons.menu))
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
                return RefreshIndicator(
                    onRefresh: () => _onRefresh(context),
                    child:PostListWidget(post: state.posts, post2:state.posts),);

                //   Container(
                //   child:
                // );
              } else if (state is MessageAddUpdateGetPostState) {
                context.read<AddGetCubit>().fetchData();
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
  _onRefresh(BuildContext context) async {
    try {
      context.read<AddGetCubit>()..fetchData();
    }catch(e){
      print(e);
    }
  }
}
