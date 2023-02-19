import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/posts/%20domain/entities/posts_entities.dart';

import '../bloc/add_get_cubit.dart';

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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.save))],
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
                child: TextFormField(
                  // controller: _titleController,
                  initialValue: postOldData!.text.toString(),
                  validator: (val) => val!.isEmpty ? 'must add the note' : null,
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
                  maxLines: 4,
                  onChanged: (val) {
                    postOldData!.text = val;
                  },
                ),
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
            placeDateTime: ''.toString(),
          );
          BlocProvider.of<AddGetCubit>(context).addNoteData(post);

          // BlocProvider.of<AddGetCubit>(context)
          //     .add(AddSickEvent(sick: sick));
        } catch (e) {
          print(e);
        }
      }
    } else {
      try {
        final post = PostsEntities(
          id: postOldData!.id.toString(),
          text: postOldData!.text.toString(),
          placeDateTime: postOldData!.placeDateTime.toString(),
        );
        BlocProvider.of<AddGetCubit>(context).updateNoteData(post);

        // BlocProvider.of<AddGetCubit>(context)
        //     .add(AddSickEvent(sick: sick));
      } catch (e) {
        print(e);
      }
    }
  }
}
