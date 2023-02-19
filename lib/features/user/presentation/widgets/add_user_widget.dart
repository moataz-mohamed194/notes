import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ domain/entities/users_entities.dart';
import '../bloc/add_get_user_cubit.dart';

class AddWidget extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,

      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/person.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: 100,
            width: 100,
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: nameController,
            validator: (val) => val!.isEmpty ? 'must add the Username' : null,
            decoration: const InputDecoration(
              labelText: 'User Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black26, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black26, width: 0),
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: emailController,
            validator: (val) =>
                val!.isEmpty || val.contains(RegExp(r"^\S+@\S+\.\S+$")) == false
                    ? "must add valid email"
                    : null,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black26, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black26, width: 0),
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: passwordController,
            validator: (val) => val!.isEmpty || val.length < 8
                ? "must add valid password and be longer than 7 chars"
                : null,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black26, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black26, width: 0),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Color(0xff5C027E),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: TextButton(
                onPressed: () =>validateFormThenUpdateOrAddUser(context),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    );
  }

  void validateFormThenUpdateOrAddUser(BuildContext context) {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      try {
        final user = UserEntities(
            id: 0.toString(),
            username: nameController.text,
            password: passwordController.text,
            email: emailController.text,
            intrestId: 1.toString(),
            imageAsBase64: '');
        BlocProvider.of<AddGetUserCubit>(context).addUserData(user);
      } catch (e) {
        print(e);
      }
    }

    Navigator.of(context).pop();
  }

}
