import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurse_space/feature/auth/data/data_sources/authRemoteDataSource.dart';
import 'package:nurse_space/feature/auth/data/repositories/authRepo.dart';

import '../../../../core/model/user_model/user.dart';

 part 'authState.dart';
 part 'authCubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {

  final AuthRepo authRepo;

  AuthCubit({required this.authRepo}) : super(const AuthState.initial());

  fetchUsers() async {
    try {
      emit(const AuthState.loading());
      List<User> users = await  authRepo.getAllUsers();
      emit(AuthState.success(users));

    } catch (e) {
      emit(
        AuthState.error("Error loading data: ${e.toString()}"),
      );
    }
  }

  Future<void> login (String email, String password) async{
    emit(const AuthState.loading());
    final either = await  authRepo.login(email, password);
    either.fold(
          (failure) {
        emit(
            AuthState.error("${failure.message}")
        );
      },
          (_) {
        emit(const AuthState.success(null),);
      },
    );



  }

  Future<void> signup (User user) async{
    emit(const AuthState.loading());
    final either = await  authRepo.signup(user);
    either.fold(
          (failure) {
        emit(
            AuthState.error("${failure.message}")
        );
      },
          (_) {
        emit(const AuthState.success(null),);
      },
    );



  }


}