import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../bloc/add_get_user_cubit.dart';
import '../bloc/user_state.dart';
import '../widgets/user_list_widget.dart';

class GetAllUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6200EE),
        title: Text('User List'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: BlocProvider(
            create: (context) => context.read<AddGetUserCubit>()..fetchData(),
            child: BlocBuilder<AddGetUserCubit, AddUpdateGetUserState>(
                builder: (context, state) {
              print(state);
              if (state is LoadingUserState) {
                return LoadingWidget();
              } else if (state is LoadedUserState) {
                return Container(
                  child: UserListWidget(
                    user: state.User,
                  ),
                );
              } else if (state is MessageAddUpdateGetUserState) {
                context.read<AddGetUserCubit>().fetchData();
              }
              return Container();
            })));
  }
}
