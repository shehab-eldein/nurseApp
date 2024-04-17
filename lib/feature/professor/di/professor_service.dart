

import 'package:get_it/get_it.dart';
import 'package:nurse_space/core/extensions/getit_extension.dart';

import '../data/data_sources/professor_remote_dataSource.dart';
import '../data/repositories/professor_repo.dart';
import '../presentation/manager/professor_cubit.dart';

class ProfessorService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<ProfessorRemoteDataSource>(
          () => ProfessorRemoteDataSource(),
    );
    sl.registerLazySingletonSafely<ProfessorRepo>(
          () => ProfessorRepo(professorRemoteDataSource: sl()),
    );
    sl.registerLazySingletonSafely<ProfessorCubit>(
          () => ProfessorCubit(professorRepo: sl()),
    );
  }
}