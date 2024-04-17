import 'package:get_it/get_it.dart';
import 'package:nurse_space/core/extensions/getit_extension.dart';
import 'package:nurse_space/feature/auth/data/data_sources/authRemoteDataSource.dart';
import 'package:nurse_space/feature/auth/data/repositories/authRepo.dart';
import 'package:nurse_space/feature/auth/presentation/manager/authCubit.dart';

class AuthService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<AuthRemoteDataSource>(
          () => AuthRemoteDataSource(),
    );
    sl.registerLazySingletonSafely<AuthRepo>(
          () => AuthRepo(authRemoteDataSource: sl()),
    );
    sl.registerLazySingletonSafely<AuthCubit>(
          () => AuthCubit(authRepo: sl()),
    );
  }
}