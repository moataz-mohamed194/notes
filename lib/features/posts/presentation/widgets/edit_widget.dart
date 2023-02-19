import 'package:flutter/material.dart';

import '../../ domain/entities/posts_entities.dart';

class EditWidget extends StatelessWidget {
  final PostsEntities? postOldData;

  const EditWidget({super.key, required this.postOldData});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      initialValue: postOldData != null ? postOldData!.text.toString() : null,
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
    );
  }
}
