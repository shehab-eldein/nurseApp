import 'package:get_it/get_it.dart';
import 'package:nurse_space/core/extensions/getit_extension.dart';
import 'package:nurse_space/feature/categories/data/data_sources/categoriesRemoteDataSource.dart';
import 'package:nurse_space/feature/categories/data/repositories/categoriesRepo.dart';
import 'package:nurse_space/feature/categories/presentation/manager/categoriesCubit.dart';

class CategoriesService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<CategoriesRemoteDataSource>(
          () => CategoriesRemoteDataSource(),
    );
    sl.registerLazySingletonSafely<CategoriesRepo>(
          () => CategoriesRepo(categoriesRemoteDataSource: sl()),
    );
    sl.registerLazySingletonSafely<CategoriesCubit>(
          () => CategoriesCubit(categoriesRepo: sl()),
    );
  }
}
