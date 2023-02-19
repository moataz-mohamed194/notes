import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/features/posts/%20domain/entities/posts_entities.dart';

import '../bloc/add_get_cubit.dart';
import '../widgets/add_widget.dart';
import '../widgets/edit_widget.dart';

class AddOrEditPostPage extends StatelessWidget {
  final PostsEntities? postOldData;
  final bool isItEdit;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();

  AddOrEditPostPage({super.key, required this.isItEdit, this.postOldData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6200EE),
        title: Text(isItEdit == true ? 'Edit Note' : 'Add Note'),
        actions: [IconButton(onPressed: ()=>validateFormThenUpdateOrAddPost(context), icon: const Icon(Icons.save))],
      ),
      body: appBody(context),
    );
  }

  Widget appBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: isItEdit==true?EditWidget(postOldData: postOldData,):AddWidget(titleController: _titleController,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateFormThenUpdateOrAddPost(BuildContext context) {
    final isValid = _formKey.currentState!.validate();

    if (isItEdit == false) {
      if (isValid) {
        try {
          final post = PostsEntities(
            id: 0.toString(),
            text: _titleController.text.toString(),
            placeDateTime: DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()).toString(),
          );
          BlocProvider.of<AddGetCubit>(context).addNoteData(post);
// print(post);
        } catch (e) {
          print(e);
        }
      }
    }
    else {
      try {
        final post = PostsEntities(
          id: postOldData!.id.toString(),
          text: postOldData!.text.toString(),
          placeDateTime: DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()).toString(),
        );
        BlocProvider.of<AddGetCubit>(context).updateNoteData(post);
// print(post);
      } catch (e) {
        print(e);
      }
    }
    Navigator.of(context).pop();
  }
}
