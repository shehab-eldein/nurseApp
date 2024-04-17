import 'package:either_dart/either.dart';
import 'package:nurse_space/core/handlers/apiErrorHandler.dart';
import 'package:nurse_space/feature/search/data/models/search_result_model.dart';
import 'package:nurse_space/feature/courses/data/data_sources/coursesRemotDataSource.dart';
import 'package:nurse_space/feature/courses/data/models/course/course.dart';

import '../../../../core/handlers/failure.dart';
import '../../../categories/data/models/category/category.dart';

class CourseRepo {
  final CoursesRemoteDataSource coursesRemoteDataSource;

  CourseRepo({required this.coursesRemoteDataSource});

  Future<Either<Failure, List<Course>>> getAllCourse([int? userId]) async {
    try {
      final List<Course> courses = userId == null
          ? await coursesRemoteDataSource.getCourses()
          : await coursesRemoteDataSource.getCourses(userId);
      return Right(courses);
    } on CustomError catch (e) {
      return Left(Failure(e.message));
    } catch (_) {
      return Left(Failure("Cannot get data"));
    }
  }

  Future<Either<Failure, List<String>>> checkOut(int courseId) async {
    final url = await coursesRemoteDataSource.checkout(courseId);
    return Right(url);
  }

}
