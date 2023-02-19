import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/features/posts/%20domain/entities/posts_entities.dart';
import 'package:notes/features/user/%20domain/entities/users_entities.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/choose_database/switch_cubit.dart';
import 'features/posts/presentation/ pages/get_all_posts.dart';
import 'features/posts/presentation/bloc/add_get_cubit.dart';
import 'features/user/presentation/bloc/add_get_user_cubit.dart';
import 'injection_container.dart' as di;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  Hive.registerAdapter(PostsEntitiesAdapter());
  Hive.registerAdapter(UserEntitiesAdapter());

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? useLocal = prefs.getBool('useLocal');

  runApp(MyApp(isItLocal: useLocal ?? false));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.isItLocal});
  final bool isItLocal;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AddGetCubit>()..fetchData()),
        BlocProvider(create: (_) => di.sl<AddGetUserCubit>()),
        BlocProvider(create: (_) => switchCubit(isSwitch: isItLocal)),
      ],
      child: MaterialApp(
        title: 'Notes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GetAllPostsPage(),
      ),
    );
  }
}
