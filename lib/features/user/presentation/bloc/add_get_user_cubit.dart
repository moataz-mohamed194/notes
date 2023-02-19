import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ domain/entities/users_entities.dart';
import '../../ domain/usecases/add_user.dart';
import '../../ domain/usecases/delete_user.dart';
import '../../ domain/usecases/get_all_users.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/string/failures.dart';
import '../../../../core/string/messages.dart';
import 'user_state.dart';

class AddGetUserCubit extends Cubit<AddUpdateGetUserState> {
  final GetAllUser getUser;
  final AddUser addUser;
  final DeleteUser deleteUser;

  AddGetUserCubit(
      {required this.addUser, required this.deleteUser, required this.getUser})
      : super(UserInitial());
  void fetchData() async {
    print('started fetch User data');
    emit(LoadingUserState());
    final failureOrDoneMessage = await getUser();
    emit(_mapFailureOrUsersToStateForGet(failureOrDoneMessage));
  }

  Future<void> addUserData(UserEntities user) async {
    print('add User Data');
    emit(LoadingUserState());
    final failureOrDoneMessage = await addUser(user);
    emit(_mapFailureOrUsersToStateForAdd(
        failureOrDoneMessage, ADD_SUCCESS_MESSAGE));
  }

  Future<void> deleteUserData(UserEntities user) async {
    print('update Note Data');
    emit(LoadingUserState());
    final failureOrDoneMessage = await deleteUser(user);
    emit(_mapFailureOrUsersToStateForAdd(
        failureOrDoneMessage, UPDATE_SUCCESS_MESSAGE));
  }

  AddUpdateGetUserState _mapFailureOrUsersToStateForGet(
      Either<Failures, List<UserEntities>> either) {
    return either.fold(
      (failure) => ErrorUserState(message: _mapFailureToMessage(failure)),
      (users) => LoadedUserState(
        User: users,
      ),
    );
  }

  AddUpdateGetUserState _mapFailureOrUsersToStateForAdd(
      Either<Failures, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorUserState(message: _mapFailureToMessage(failure)),
      (_) => MessageAddUpdateGetUserState(
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
