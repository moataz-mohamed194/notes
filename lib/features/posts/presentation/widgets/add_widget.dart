import 'package:flutter/material.dart';

class AddWidget extends StatelessWidget {
  final TextEditingController titleController;

  const AddWidget({super.key, required this.titleController});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: titleController,
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
      onChanged: (val) {},
    );
  }
}
