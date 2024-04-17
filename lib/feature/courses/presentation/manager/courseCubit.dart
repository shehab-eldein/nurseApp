import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurse_space/core/handlers/failure.dart';
import 'package:nurse_space/feature/search/data/models/search_result_model.dart';
import 'package:nurse_space/feature/auth/data/data_sources/authRemoteDataSource.dart';
import 'package:nurse_space/feature/auth/data/repositories/authRepo.dart';
import 'package:nurse_space/feature/courses/data/models/course/course.dart';
import 'package:nurse_space/feature/courses/data/repositories/courseRepo.dart';

import '../../../categories/data/models/category/category.dart';

part 'courseState.dart';
part 'courseCubit.freezed.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepo courseRepo;

  CourseCubit({required this.courseRepo}) : super(const CourseState.initial());

  List<Course> allCoursesList = [];
  List<Course> myCoursesList = [];

  void getAllCourses() async {
    emit(CourseState.loading());

    if (allCoursesList.isEmpty) {
      print("NEW DATAAA");
      final Either<Failure, List<Course>> categories =
          await courseRepo.getAllCourse();

      categories.fold((failure) {
        emit(CourseState.error(failure.message));
      },
          (List<Course> courses) => {
                allCoursesList = courses,
                print(courses.length),
                emit(CourseState.success(courses))
              });
    } else {
      print("Cached DATAAA");
      emit(CourseState.success(allCoursesList));
    }
  }

  void getMyCourses(int userId) async {
    emit(CourseState.loading());

    if (myCoursesList.isEmpty) {
      print("NEW DATAAA");
      final Either<Failure, List<Course>> categories =
          await courseRepo.getAllCourse(userId);

      categories.fold((failure) {
        emit(CourseState.error(failure.message));
      },
          (List<Course> courses) =>
              {myCoursesList = courses, emit(CourseState.success(courses))});
    } else {
      print("Cached DATAAA");
      emit(CourseState.success(myCoursesList));
    }
  }



  void checkOut(int courseId) async {
    emit(CourseState.loading());

    final Either<Failure, List<String>> url =
        await courseRepo.checkOut(courseId);

    url.fold((error) {}, (url) {
      emit(CourseState.success(url));
    });
    print("CUBIIIT");
    print(url.right);
  }
}
