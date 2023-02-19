import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/posts/%20domain/entities/posts_entities.dart';
import 'package:notes/features/posts/%20domain/usecases/get_all_posts.dart';

import '../../ domain/usecases/add _post.dart';
import '../../ domain/usecases/update_post.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/string/failures.dart';
import '../../../../core/string/messages.dart';
import 'post_state.dart';

class AddGetCubit extends Cubit<AddUpdateGetPostState> {
  final GetAllPosts getPosts;
  final AddPost addPost;
  final UpdatePost updatePost;

  AddGetCubit(
      {required this.getPosts, required this.addPost, required this.updatePost})
      : super(PostInitial());
  void fetchData() async {
    print('started fetch data');
    emit(LoadingPostsState());
    final failureOrDoneMessage = await getPosts();
    emit(_mapFailureOrPostsToStateForGet(failureOrDoneMessage));
  }

  Future<void> addNoteData(PostsEntities post) async {
    print('add Note Data');
    emit(LoadingPostsState());
    final failureOrDoneMessage = await addPost(post);
    emit(_mapFailureOrPostsToStateForAdd(
        failureOrDoneMessage, ADD_SUCCESS_MESSAGE));
  }

  Future<void> updateNoteData(PostsEntities post) async {
    print('update Note Data');
    emit(LoadingPostsState());
    final failureOrDoneMessage = await updatePost(post);
    emit(_mapFailureOrPostsToStateForAdd(
        failureOrDoneMessage, UPDATE_SUCCESS_MESSAGE));
  }

  AddUpdateGetPostState _mapFailureOrPostsToStateForGet(
      Either<Failures, List<PostsEntities>> either) {
    return either.fold(
      (failure) => ErrorPostsState(message: _mapFailureToMessage(failure)),
      (posts) => LoadedPostsState(
        posts: posts,
      ),
    );
  }

  AddUpdateGetPostState _mapFailureOrPostsToStateForAdd(
      Either<Failures, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorPostsState(message: _mapFailureToMessage(failure)),
      (_) => MessageAddUpdateGetPostState(
        message: message,
      ),
    );
  }

  String _mapFailureToMessage(Failures failure) {
    switch (failure.runtimeType) {
      case OfflineFailures:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailures:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
