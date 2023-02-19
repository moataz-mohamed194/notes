import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:notes/features/posts/%20domain/entities/posts_entities.dart';
import 'package:notes/features/user/%20domain/entities/users_entities.dart';

import 'features/choose_database/switch_cubit.dart';
import 'features/posts/presentation/ pages/get_all_posts.dart';
import 'features/posts/presentation/bloc/add_get_cubit.dart';
import 'features/user/presentation/bloc/add_get_user_cubit.dart';
import 'injection_container.dart' as di;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  // Hive.registerAdapter(PostsA());

  var postsTasksBox = await Hive.openBox<PostsEntities>('Post');
  var UserTasksBox = await Hive.openBox<UserEntities>('User');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AddGetCubit>()..fetchData()),
        BlocProvider(create: (_) => di.sl<AddGetUserCubit>()),
        BlocProvider(create: (_) => switchCubit()),
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
