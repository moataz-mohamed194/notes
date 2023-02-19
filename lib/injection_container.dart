import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/posts/ domain/repositories/post_repositorie.dart';
import 'features/posts/ domain/usecases/add _post.dart';
import 'features/posts/ domain/usecases/get_all_posts.dart';
import 'features/posts/ domain/usecases/update_post.dart';
import 'features/posts/data/datasources/post_remote_data_source.dart';
import 'features/posts/data/repositories/post_repositories.dart';
import 'features/posts/presentation/bloc/add_get_cubit.dart';
import 'features/user/ domain/repositories/user_repositorie.dart';
import 'features/user/ domain/usecases/add_user.dart';
import 'features/user/ domain/usecases/delete_user.dart';
import 'features/user/ domain/usecases/get_all_users.dart';
import 'features/user/data/datasources/user_remote_data_source.dart';
import 'features/user/data/repositories/user_repositories.dart';
import 'features/user/presentation/bloc/add_get_user_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //Bloc

  sl.registerFactory(
      () => AddGetCubit(getPosts: sl(), addPost: sl(), updatePost: sl()));

  sl.registerFactory(
      () => AddGetUserCubit(addUser: sl(), deleteUser: sl(), getUser: sl()));

  //UseCase
  sl.registerLazySingleton(() => AddPost(sl()));
  sl.registerLazySingleton(() => GetAllPosts(sl()));
  sl.registerLazySingleton(() => UpdatePost(sl()));
  sl.registerLazySingleton(() => AddUser(sl()));
  sl.registerLazySingleton(() => DeleteUser(sl()));
  sl.registerLazySingleton(() => GetAllUser(sl()));

  //Repository
  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoriesImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoriesImpl(remoteDataSource: sl(), networkInfo: sl()));

  //Datasources
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImple(client: sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImple(client: sl()));

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
