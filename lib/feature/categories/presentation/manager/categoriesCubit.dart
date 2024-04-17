import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurse_space/core/handlers/failure.dart';
import 'package:nurse_space/feature/auth/data/data_sources/authRemoteDataSource.dart';
import 'package:nurse_space/feature/auth/data/repositories/authRepo.dart';
import 'package:nurse_space/feature/courses/data/repositories/courseRepo.dart';

import '../../data/models/category/category.dart';
import '../../data/repositories/categoriesRepo.dart';


part 'categoriesState.dart';
part 'categoriesCubit.freezed.dart';




class CategoriesCubit extends Cubit<CategoriesState> {

  final CategoriesRepo categoriesRepo;

  CategoriesCubit({required this.categoriesRepo}) : super(const CategoriesState.loading());

  List<CategoryOfCourse> categorisList  = [];

  void getAllCategories() async {



    if (categorisList.isEmpty) {
      print("NEW DATAAA");
      final Either<Failure,List<CategoryOfCourse>> categories = await categoriesRepo.getAllCategories();

      categories.fold(
              (failure) {
            emit(CategoriesState.error(failure.message));
          },
              (List<CategoryOfCourse> categories) => {
            categorisList = categories,
            print(categories.length),
            emit(CategoriesState.success(categories))
          });
    }else {
      print("Cached DATAAA");
      emit(CategoriesState.success(categorisList));
    }



  }
}