import 'package:equatable/equatable.dart';

import '../../ domain/entities/users_entities.dart';

abstract class AddUpdateGetUserState extends Equatable {
  const AddUpdateGetUserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends AddUpdateGetUserState {}

class LoadingUserState extends AddUpdateGetUserState {}

class LoadedUserState extends AddUpdateGetUserState {
  final List<UserEntities> User;

  LoadedUserState({required this.User});

  @override
  List<Object> get props => [User];
}

class ErrorUserState extends AddUpdateGetUserState {
  final String message;

  ErrorUserState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddUpdateGetUserState extends AddUpdateGetUserState {
  final String message;

  MessageAddUpdateGetUserState({required this.message});

  @override
  List<Object> get props => [message];
}
