import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ pages/add_user.dart';
import '../../ domain/entities/users_entities.dart';

class UserListWidget extends StatelessWidget {
  final List<UserEntities> user;

  const UserListWidget({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: user.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(user[index].username.toString()),
            trailing: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {},
            ));
      },
      separatorBuilder: (context, index) => Divider(thickness: 1),
    );
  }
}
