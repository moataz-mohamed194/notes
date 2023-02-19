import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class switchCubit extends Cubit<bool> {
  bool isSwitch;

  switchCubit({required this.isSwitch}) : super(false);
  void changeSwitcher(bool val) async {
    isSwitch = val;
    print(isSwitch);
    emit(isSwitch);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('useLocal', isSwitch);
  }
}
