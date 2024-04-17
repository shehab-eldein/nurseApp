


import 'package:either_dart/either.dart';
import 'package:nurse_space/core/handlers/apiErrorHandler.dart';
import 'package:nurse_space/feature/categories/data/data_sources/categoriesRemoteDataSource.dart';
import 'package:nurse_space/feature/courses/data/data_sources/coursesRemotDataSource.dart';

import '../../../../core/handlers/failure.dart';
import '../../../categories/data/models/category/category.dart';

class CategoriesRepo {

  final  CategoriesRemoteDataSource categoriesRemoteDataSource;

  CategoriesRepo({required this.categoriesRemoteDataSource});



  Future<Either<Failure, List<CategoryOfCourse>>> getAllCategories() async {

    try{

      final List<CategoryOfCourse>categories = await categoriesRemoteDataSource.getAllCategories();
      return Right(categories);

    }on CustomError catch (e){

      return Left(Failure(e.message));

    }catch (_){
      return Left(Failure("Cannot get data"));
    }


  }

}