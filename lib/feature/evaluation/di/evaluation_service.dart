import 'package:get_it/get_it.dart';
import 'package:nurse_space/core/extensions/getit_extension.dart';
import 'package:nurse_space/feature/evaluation/data/data_sources/evaluationRemoteDataSource.dart';
import 'package:nurse_space/feature/evaluation/data/repositories/evaluationRepo.dart';
import 'package:nurse_space/feature/evaluation/presentation/manager/evaluationCubit.dart';

class EvaluationService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<EvaluationRemoteDataSource>(
      () => EvaluationRemoteDataSource(),
    );
    sl.registerLazySingletonSafely<EvaluationRepo>(
      () => EvaluationRepo(sl()),
    );
    sl.registerLazySingletonSafely<EvaluationCubit>(
      () => EvaluationCubit(evaluationRepo: sl()),
    );
  }
}
