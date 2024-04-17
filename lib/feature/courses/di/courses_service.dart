import 'package:get_it/get_it.dart';
import 'package:nurse_space/core/extensions/getit_extension.dart';

import '../data/data_sources/coursesRemotDataSource.dart';
import '../data/repositories/courseRepo.dart';
import '../presentation/manager/courseCubit.dart';

class CoursesService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<CoursesRemoteDataSource>(
      () => CoursesRemoteDataSource(),
    );
    sl.registerLazySingletonSafely<CourseRepo>(
      () => CourseRepo(coursesRemoteDataSource: sl()),
    );
    sl.registerLazySingletonSafely<CourseCubit>(
      () => CourseCubit(courseRepo: sl()),
    );
  }
}
