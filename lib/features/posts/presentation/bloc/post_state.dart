import 'package:equatable/equatable.dart';

import '../../ domain/entities/posts_entities.dart';

abstract class AddUpdateGetPostState extends Equatable {
  const AddUpdateGetPostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends AddUpdateGetPostState {}

class LoadingPostsState extends AddUpdateGetPostState {}

class LoadedPostsState extends AddUpdateGetPostState {
  final List<PostsEntities> posts;

  LoadedPostsState({required this.posts});

  @override
  List<Object> get props => [posts];
}

class ErrorPostsState extends AddUpdateGetPostState {
  final String message;

  ErrorPostsState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddUpdateGetPostState extends AddUpdateGetPostState {
  final String message;

  MessageAddUpdateGetPostState({required this.message});

  @override
  List<Object> get props => [message];
}
