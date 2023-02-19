import 'package:flutter/material.dart';
import '../widgets/add_user_widget.dart';

class AddOrEditUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6200EE),
        title: Text('Add User'),
      ),
      body: appBody(context),
    );
  }

  Widget appBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: AddWidget(),
      ),
    );
  }
}
