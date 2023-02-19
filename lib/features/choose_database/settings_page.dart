import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/choose_database/switch_cubit.dart';

class SettingPage extends StatelessWidget {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
        backgroundColor: Color(0xff6200EE),
      ),
      body: Container(
        // alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10),
        height: 100,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width - 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Use Local Database for Users',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      'Instead of Using HTTP call to work with the users, please use Hive',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )),
            BlocBuilder<switchCubit, bool>(
              builder: (context, isChecked) {
                return Switch(
                  value: context.read<switchCubit>().isSwitch,
                  onChanged: (value) {
                    BlocProvider.of<switchCubit>(context).changeSwitcher(value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
