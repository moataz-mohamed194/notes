import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/features/posts/%20domain/entities/posts_entities.dart';

import '../../ domain/entities/users_entities.dart';
import '../bloc/add_get_user_cubit.dart';
import '../widgets/add_user_widget.dart';

class AddOrEditUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6200EE),
        title: Text('Add User'),
        // actions: [
        //   IconButton(
        //       onPressed: () => validateFormThenUpdateOrAddUser(context),
        //       icon: const Icon(Icons.save))
        // ],
      ),
      body: appBody(context),
    );
  }

  Widget appBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: AddWidget(),
      ),
    );
  }
}
