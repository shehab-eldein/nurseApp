import 'package:get_it/get_it.dart';
import 'package:nurse_space/core/extensions/getit_extension.dart';
import 'package:nurse_space/feature/profile/presentation/manager/profile_cubit.dart';

import '../data/data_sources/profile_remote_dataSource.dart';
import '../data/repositories/profile_repo.dart';

class ProfileService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSource(),
    );
    sl.registerLazySingletonSafely<ProfileRepo>(
      () => ProfileRepo(profileRemoteDataSource: sl()),
    );
    sl.registerLazySingletonSafely<ProfileCubit>(
      () => ProfileCubit(profileRepo: sl()),
    );
  }
}
